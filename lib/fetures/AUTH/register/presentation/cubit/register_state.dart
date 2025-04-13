abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String token;
  RegisterSuccess(this.token);
}

class RegisterError extends RegisterState {
  final String message;
  RegisterError(this.message);
}