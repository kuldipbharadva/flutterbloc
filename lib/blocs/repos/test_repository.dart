import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_demo/blocs/api_provider/test_api_provider.dart';
import 'package:flutter_bloc_demo/blocs/models/test_response.dart';

class TestRepository {
//  manage your logic to fill data using your provider

  final yourProvider = TestApiProvider();

  Future<TestResponse> getTestApiData(BuildContext context) async => yourProvider.getTestApiData(context);
}