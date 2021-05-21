import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/blocs/models/login_response.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginStateInit extends LoginState {}
class LoginStateLoading extends LoginState {}
class LoginStateLoaded extends LoginState {
  final LoginResponse loginResponse;

  LoginStateLoaded(this.loginResponse);
}
class LoginStateError extends LoginState {
  final String errorMsg;

  LoginStateError(this.errorMsg);
}