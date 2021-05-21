import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginValidateEvent extends LoginEvent {
  final Map<String, String> headers;
  final Map<String, dynamic> body;

  LoginValidateEvent(this.headers, this.body);

  @override
  List<Object> get props => [];
}