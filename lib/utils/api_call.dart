import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/blocs/models/authentication_response.dart';
import 'package:flutter_bloc_demo/utils/common_functions.dart';
import 'package:http/http.dart' as http;


enum MethodType { GET, POST, PUT, DELETE, PATCH }

class ApiCall {
  static final String baseUrl = "https://reqbin.com/echo/";

  static String token = "";

  static Map<String, String> getHeader(String token) {
    Map<String, String> myHeader = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "bearer $token"
    };
    return myHeader;
  }

  static Future<dynamic> makeApiCall(BuildContext context, String url,
      MethodType methodType,
      {Map<String, String> headers, dynamic body}) async {
    var responseJson;
    Map<String, String> defaultHeaders = {"Content-type": "application/json"};
    try {
      print("req url :: " + url);
      print("req header :: " + headers.toString());
      print("req body :: " + body.toString());

      http.Response response;
      switch (methodType) {
        case MethodType.GET:
          response = await http.get(Uri.parse(url),
              headers: headers != null ? headers : defaultHeaders);
          break;
        case MethodType.POST:
          response = await http.post(Uri.parse(url),
              headers: headers != null ? headers : defaultHeaders,
              body: body != null ? json.encode(body) : json.encode({}));
          break;
        case MethodType.PUT:
          response = await http.put(Uri.parse(url),
              headers: headers != null ? headers : defaultHeaders,
              body: body != null ? json.encode(body) : json.encode({}));
          break;
        case MethodType.DELETE:
          response = await http.delete(Uri.parse(url),
              headers: headers != null ? headers : defaultHeaders);
          break;
        case MethodType.PATCH:
          response = await http.patch(Uri.parse(url),
              headers: headers != null ? headers : defaultHeaders,
              body: body != null ? json.encode(body) : json.encode({}));
          break;
      }

      switch (response.statusCode) {
        case 200:
        case 201:
          // return json.decode(response.body.toString());
          return json.decode(response.body);
        case 400:
          CommonFunctions.showToast(
              context, "${response.statusCode} Bad request!");
          break;
        case 401:
          Map<String, String> tokenParam = {
            "username": "user@gmail.com",
            "password": "user@123"
          };
          var resToken = await http.post(
              Uri.parse("http://imitationapi.infibrain.com/api/Authentication/token"),
              headers: defaultHeaders,
              body: jsonEncode(tokenParam));
          AuthenticationResponse tokenRes = AuthenticationResponse.fromJson(jsonDecode(resToken.body));
          String newToken = tokenRes.result?.token;
          print("token :: " + tokenRes.result?.token);
          token = tokenRes.result?.token;
          responseJson = await makeApiCall(context, url, methodType,
              headers: headers != null ? getHeader(newToken) : defaultHeaders,
              body: body);
          break;
        case 403:
          CommonFunctions.showToast(
              context, "${response.statusCode} Forbidden!");
          break;
        case 404:
          CommonFunctions.showToast(
              context, "${response.statusCode} Not found!");
          break;
        case 405:
          CommonFunctions.showToast(
              context, "${response.statusCode} Method not allowed!");
          break;
        case 406:
          CommonFunctions.showToast(
              context, "${response.statusCode} Not accepted!");
          break;
        case 409:
          CommonFunctions.showToast(
              context, "${response.statusCode} Conflict!");
          break;
        case 500:
          CommonFunctions.showToast(
              context, "${response.statusCode} Internal server error!");
          break;
        case 502:
          CommonFunctions.showToast(
              context, "${response.statusCode} Bad gateway!");
          break;
        default:
          CommonFunctions.showToast(
              context, "${response.statusCode} Something went wrong!");
          return responseJson;
      }
    } on SocketException {
      return throw Exception('No Internet connection');
    }
    return responseJson;
  }
}