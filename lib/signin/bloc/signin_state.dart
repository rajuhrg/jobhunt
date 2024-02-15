part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {

}

class SigninInvalidState extends SigninState {
  
}
class SigninValidState extends SigninState {
  
}
class SigninErrorState extends SigninState {
  final String errorMessage;

  SigninErrorState(this.errorMessage);
}
class SigninLoadingState extends SigninState{

}
