abstract class RegisterState {}

class InitRegisterState extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class SuccessRegisterState extends RegisterState {}

class ErrorRegisterState extends RegisterState {
  String errorMessage;
  ErrorRegisterState(this.errorMessage);
}
