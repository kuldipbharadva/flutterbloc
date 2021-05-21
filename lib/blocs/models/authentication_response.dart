/// Success : true
/// Messages : [""]
/// Result : {"Token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEiLCJuYmYiOjE2MjEzMjU2MzgsImV4cCI6MTYyMTYxMzYzOCwiaWF0IjoxNjIxMzI1NjM4fQ.4YM8t2bJx9WXoHBNDvDd3l1pc_JIFKM1c7ciduXo-IY","ExpireTime":"2021-05-21T21:43:58+05:30"}

class AuthenticationResponse {
  bool _success;
  List<String> _messages;
  Result _result;

  bool get success => _success;
  List<String> get messages => _messages;
  Result get result => _result;

  AuthenticationResponse({
      bool success, 
      List<String> messages, 
      Result result}){
    _success = success;
    _messages = messages;
    _result = result;
}

  AuthenticationResponse.fromJson(dynamic json) {
    _success = json["Success"];
    _messages = json["Messages"] != null ? json["Messages"].cast<String>() : [];
    _result = json["Result"] != null ? Result.fromJson(json["Result"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Success"] = _success;
    map["Messages"] = _messages;
    if (_result != null) {
      map["Result"] = _result.toJson();
    }
    return map;
  }

}

/// Token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEiLCJuYmYiOjE2MjEzMjU2MzgsImV4cCI6MTYyMTYxMzYzOCwiaWF0IjoxNjIxMzI1NjM4fQ.4YM8t2bJx9WXoHBNDvDd3l1pc_JIFKM1c7ciduXo-IY"
/// ExpireTime : "2021-05-21T21:43:58+05:30"

class Result {
  String _token;
  String _expireTime;

  String get token => _token;
  String get expireTime => _expireTime;

  Result({
      String token, 
      String expireTime}){
    _token = token;
    _expireTime = expireTime;
}

  Result.fromJson(dynamic json) {
    _token = json["Token"];
    _expireTime = json["ExpireTime"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Token"] = _token;
    map["ExpireTime"] = _expireTime;
    return map;
  }

}