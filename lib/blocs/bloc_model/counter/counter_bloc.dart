import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<bool, int>{
  CounterBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(bool event) async* {
    if (event) {
      yield state+1;
      return;
    }
    yield state-1;
    return;
  }
}