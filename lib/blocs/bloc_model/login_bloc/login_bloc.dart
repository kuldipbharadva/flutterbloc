import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/login_bloc/login_event.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/login_bloc/login_state.dart';
import 'package:flutter_bloc_demo/blocs/models/login_response.dart';
import 'package:flutter_bloc_demo/blocs/repos/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState, this.repository) : super(LoginStateInit());

  BuildContext context;
  final LoginRepository repository;
  LoginResponse _response;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if(event is LoginValidateEvent) {
      yield LoginStateLoading();
      _response = await repository.getLoginApiData(context, event.headers, event.body);
      yield LoginStateLoaded(_response);
    }
  }
}