abstract class LoginState {}

class InitLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {}

class ErrorLoginState extends LoginState {
  String errorMessage;
  ErrorLoginState(this.errorMessage);
}
