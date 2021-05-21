import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_demo/blocs/api_provider/login_api_provider.dart';
import 'package:flutter_bloc_demo/blocs/api_provider/test_api_provider.dart';
import 'package:flutter_bloc_demo/blocs/models/login_response.dart';
import 'package:flutter_bloc_demo/blocs/models/test_response.dart';

class LoginRepository {
  final yourProvider = LoginApiProvider();

  Future<LoginResponse> getLoginApiData(BuildContext context, Map<String, String> headers, Map<String, dynamic> body) async =>
      yourProvider.getLoginResponse(context, headers, body);
}
