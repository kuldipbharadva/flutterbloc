import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/blocs/models/login_response.dart';
import 'package:flutter_bloc_demo/blocs/models/test_response.dart';
import 'package:flutter_bloc_demo/utils/api_call.dart';

class LoginApiProvider {

  Future<LoginResponse> getLoginResponse(BuildContext context, Map<String, String> headers, Map<String, dynamic> body) async {
    return ApiCall.makeApiCall(context, "http://imitationapi.infibrain.com/api/Account/login", MethodType.POST, headers: headers, body: body).then((value) {
      if (value != null) {
        print("api response value login :: " + value.toString());
        return LoginResponse.fromJson(value);
      } else {
        print("api response value login null :: ");
        return LoginResponse();
      }
    }, onError: (error) {
      print("error login ::: " + error.toString());
      return LoginResponse();
    }).catchError((onError) {
      print("catchError login ::: " + onError.toString());
      return LoginResponse();
    });
  }
}