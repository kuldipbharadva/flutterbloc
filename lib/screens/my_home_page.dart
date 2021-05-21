import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/counter/counter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/login_bloc/login_bloc.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/login_bloc/login_event.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/login_bloc/login_state.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/test_bloc/test_bloc.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/test_bloc/test_event.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/test_bloc/test_state.dart';
import 'package:flutter_bloc_demo/screens/my_home_page2.dart';
import 'package:flutter_bloc_demo/utils/api_call.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    loadResponse();
  }

  loadResponse() async {
    BlocProvider.of<TestBloc>(context).add(TestEvent.GetResponse);
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          BlocBuilder<CounterBloc, int>(
            bloc: _counterBloc,
              builder: (context, state) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        // '$_counter',
                        '$state',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline4,
                      ),
                    ],
                  ),
                );
              }
          ),
          BlocBuilder<TestBloc, TestState>(builder: (context, TestState state) {
            if(state is TestResInit) {
              print("state :: init");
            }
            if(state is TestResLoading) {
              print("state :: loading");
            }
            if(state is TestResLoaded) {
              print("state :: loaded");
            }
            return (state is TestResLoaded) ? Text(state.response.success) : Text("Loading");
          }),

          BlocBuilder<LoginBloc, LoginState>(bloc: _loginBloc,builder: (context, LoginState state) {
            String currentState = "";
            if(state is LoginStateInit) {
              print("state :: init");
            }
            if(state is LoginStateLoading) {
              print("state :: loading");
            }
            return (state is LoginStateLoaded) ? Text(state.loginResponse.result.toJson().toString()) : (state is !LoginStateInit) ? CircularProgressIndicator() : (state is LoginStateLoaded && state.loginResponse !=null) ?Text(state.loginResponse.result.toJson().toString()) : Container();
          })
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "11",
            onPressed: () => _counterBloc.add(true),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "12",
            onPressed: () => _counterBloc.add(false),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "13",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => MyHomePage2()));
            },
            tooltip: 'Next',
            child: Icon(Icons.forward),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "14",
            onPressed: () {
              apiCallLogin();
            },
            tooltip: 'Next',
            child: Icon(Icons.forward),
          ),
        ],
      ),
    );
  }

  apiCallLogin() {
    Map<String, dynamic> param = {
      "email": "test@gmail.com",
      "password": "12345678"
    };

    // ApiCall.makeApiCall(context, "https://imitationapi.infibrain.com/api/Account/login", MethodType.POST, headers: ApiCall.getHeader(ApiCall.token), body: param).then((value) {
    //   print("main login response static call::");
    // });

    _loginBloc.add(LoginValidateEvent(ApiCall.getHeader(ApiCall.token), param));
    print("main login response ::");
  }
}
