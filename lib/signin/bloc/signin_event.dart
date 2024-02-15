part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {

}

class SignInTextChangeEvent extends SigninEvent {
   final String usernameval;
   final String passwordval;
  SignInTextChangeEvent(this.usernameval, this.passwordval);
}

class SignInSubmittedEvent extends SigninEvent {
  final String username;
  final String password;
  SignInSubmittedEvent(this.username, this.password);
}