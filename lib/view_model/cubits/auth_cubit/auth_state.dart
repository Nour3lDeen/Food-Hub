part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ChangePasswordVisibilityState extends AuthState {}

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class LoginErrorState extends AuthState {
  final String msg;

  LoginErrorState(this.msg);
}

final class RegisterLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {}

final class RegisterErrorState extends AuthState {
  final String msg;

  RegisterErrorState(this.msg);
}


final class ForgetPasswordLoadingState extends AuthState {}

final class ForgetPasswordSuccessState extends AuthState {}

final class ForgetPasswordErrorState extends AuthState {
  final String msg;

  ForgetPasswordErrorState(this.msg);
}
