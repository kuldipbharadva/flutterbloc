import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/blocs/models/test_response.dart';
import 'package:flutter_bloc_demo/utils/api_call.dart';

class TestApiProvider {

  Future<TestResponse> getTestApiData(BuildContext context) async {
    return ApiCall.makeApiCall(context, ApiCall.baseUrl + "get/json", MethodType.GET).then((value) {
      if (value != null) {
        print("api response value :: " + value.toString());
        return TestResponse.fromJson(value);
      } else {
        print("api response value null :: ");
        return TestResponse();
      }
    }, onError: (error) {
      print("error ::: " + error.toString());
      return TestResponse();
    }).catchError((onError) {
      print("catchError ::: " + onError.toString());
      return TestResponse();
    });
  }
}