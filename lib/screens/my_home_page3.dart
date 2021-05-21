import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/counter/counter_bloc.dart';

class MyHomePage3 extends StatefulWidget {
  MyHomePage3({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePage3State createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3> {

  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Screen"),
      ),
      body: BlocBuilder<CounterBloc, int>(
          bloc: _counterBloc,
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Third Screen',
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
            heroTag: "31",
            onPressed: () => _counterBloc.add(true),
            tooltip: 'Increment 1',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "32",
            onPressed: () => _counterBloc.add(false),
            tooltip: 'Decrement 2',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
