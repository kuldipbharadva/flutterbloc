/// success : "true"

class TestResponse {
  String _success;

  String get success => _success;

  TestResponse({
      String success}){
    _success = success;
}

  TestResponse.fromJson(dynamic json) {
    _success = json["success"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    return map;
  }

}