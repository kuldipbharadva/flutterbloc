import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/blocs/models/test_response.dart';

abstract class TestState extends Equatable {
  const TestState();
  List<Object> get props => [];
}
class TestResInit extends TestState {
  @override
  List<Object> get props => throw UnimplementedError();
}
class TestResLoading extends TestState {
  @override
  List<Object> get props => throw UnimplementedError();
}
class TestResLoaded extends TestState {
  final TestResponse response;

  TestResLoaded(this.response);

  @override
  List<Object> get props => [response];
}
class TestResError extends TestState {
  final String msg;

  TestResError(this.msg);

  @override
  List<Object> get props => [msg];
}
