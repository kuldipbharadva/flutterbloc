import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/test_bloc/test_event.dart';
import 'package:flutter_bloc_demo/blocs/bloc_model/test_bloc/test_state.dart';
import 'package:flutter_bloc_demo/blocs/models/test_response.dart';
import 'package:flutter_bloc_demo/blocs/repos/test_repository.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  BuildContext context;
  final TestRepository repository;
  TestResponse _response;

  TestBloc(TestState initialState, this.repository) : super(initialState);

  TestState get initialState => TestResInit();

  @override
  Stream<TestState> mapEventToState(TestEvent event) async* {
    if (event == TestEvent.GetResponse) {
      yield TestResLoading();
      _response = await repository.getTestApiData(context);
      yield TestResLoaded(_response);
    }
  }
}
