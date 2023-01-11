part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}
class Loading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginFailure extends LoginState {
  final String msg;
  LoginFailure(this.msg);
}

