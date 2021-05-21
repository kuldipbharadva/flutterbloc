import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/counter/counter_bloc.dart';
import 'package:flutter_bloc_demo/screens/my_home_page3.dart';

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {

  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: BlocBuilder<CounterBloc, int>(
          bloc: _counterBloc,
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Next Screen',
                  ),
                  Text(
                    // '$_counter',
                    '$state',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4,
                  )
                ],
              ),
            );
          }
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "21",
            onPressed: () => _counterBloc.add(true),
            tooltip: 'Increment 1',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "22",
            onPressed: () => _counterBloc.add(false),
            tooltip: 'Decrement 2',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "23",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => MyHomePage3()));
            },
            tooltip: 'Next',
            child: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
