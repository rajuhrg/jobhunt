import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    // on<SigninEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<SignInTextChangeEvent>((event, emit) {
      if(event.usernameval.length < 3) {
        emit(SigninErrorState("Please enter valid username"));
      }else 
      if(event.passwordval.length < 3){
        emit(SigninErrorState("Enter valid password"));
      }else {
        SigninValidState();
      }
    });
    on<SignInSubmittedEvent>((event, emit) => logding(event,emit));
  }
}

logding(SignInSubmittedEvent event, Emitter<SigninState> emit) {
  emit(SigninLoadingState());
}
