import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/login_bloc/login_bloc.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/login_bloc/login_state.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/test_bloc/test_bloc.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/test_bloc/test_state.dart';
import 'package:flutter_bloc_demo/blocs/repos/login_repository.dart';
import 'package:flutter_bloc_demo/blocs/repos/test_repository.dart';

import 'blocs/bloc_model/counter/counter_bloc.dart';
import 'screens/my_home_page.dart';
import 'utils/my_http_override.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc(0)),
        BlocProvider<TestBloc>(create: (context) => TestBloc(TestResInit(), TestRepository())),
        BlocProvider<LoginBloc>(create: (context) => LoginBloc(LoginStateInit(), LoginRepository())),
      ],
      child: MaterialApp(
        title: 'Flutter Bloc Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}