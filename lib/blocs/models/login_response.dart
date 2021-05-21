/// Success : true
/// Messages : ["Login successful."]
/// Result : {"user":{"Id":58,"UserTypeId":41,"UserType":"Wholesaler","CustomerTypeId":1,"CustomerTypeName":"Mij","FirstName":"Test user","LastName":"Test user","Email":"test@gmail.com","Password":null,"GenderId":3,"Gender":"Male","CountryId":12,"CountryName":"India","City":"Rajkot","AddressLine1":null,"AddressLine2":null,"PhoneNumber":"1234567890","CountryCode":"+91","ProfileImage":"3a428e45-9a65-4fd3-becd-419f14b2a24f","IsActive":false,"Active":"In Active","IsDeleted":false,"CreatedBy":null,"UpdatedBy":null,"CreatedOn":null,"UpdatedOn":null,"IsApproveByAdmin":true,"strApprovedByAdmin":null,"IsDeactivated":false,"UserList":null,"ReferredBy":null,"file":null,"Success":false,"Message":null}}

class LoginResponse {
  bool _success;
  List<String> _messages;
  Result _result;

  bool get success => _success;
  List<String> get messages => _messages;
  Result get result => _result;

  LoginResponse({
      bool success, 
      List<String> messages, 
      Result result}){
    _success = success;
    _messages = messages;
    _result = result;
}

  LoginResponse.fromJson(dynamic json) {
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

/// user : {"Id":58,"UserTypeId":41,"UserType":"Wholesaler","CustomerTypeId":1,"CustomerTypeName":"Mij","FirstName":"Test user","LastName":"Test user","Email":"test@gmail.com","Password":null,"GenderId":3,"Gender":"Male","CountryId":12,"CountryName":"India","City":"Rajkot","AddressLine1":null,"AddressLine2":null,"PhoneNumber":"1234567890","CountryCode":"+91","ProfileImage":"3a428e45-9a65-4fd3-becd-419f14b2a24f","IsActive":false,"Active":"In Active","IsDeleted":false,"CreatedBy":null,"UpdatedBy":null,"CreatedOn":null,"UpdatedOn":null,"IsApproveByAdmin":true,"strApprovedByAdmin":null,"IsDeactivated":false,"UserList":null,"ReferredBy":null,"file":null,"Success":false,"Message":null}

class Result {
  User _user;

  User get user => _user;

  Result({
      User user}){
    _user = user;
}

  Result.fromJson(dynamic json) {
    _user = json["user"] != null ? User.fromJson(json["user"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_user != null) {
      map["user"] = _user.toJson();
    }
    return map;
  }

}

/// Id : 58
/// UserTypeId : 41
/// UserType : "Wholesaler"
/// CustomerTypeId : 1
/// CustomerTypeName : "Mij"
/// FirstName : "Test user"
/// LastName : "Test user"
/// Email : "test@gmail.com"
/// Password : null
/// GenderId : 3
/// Gender : "Male"
/// CountryId : 12
/// CountryName : "India"
/// City : "Rajkot"
/// AddressLine1 : null
/// AddressLine2 : null
/// PhoneNumber : "1234567890"
/// CountryCode : "+91"
/// ProfileImage : "3a428e45-9a65-4fd3-becd-419f14b2a24f"
/// IsActive : false
/// Active : "In Active"
/// IsDeleted : false
/// CreatedBy : null
/// UpdatedBy : null
/// CreatedOn : null
/// UpdatedOn : null
/// IsApproveByAdmin : true
/// strApprovedByAdmin : null
/// IsDeactivated : false
/// UserList : null
/// ReferredBy : null
/// file : null
/// Success : false
/// Message : null

class User {
  int _id;
  int _userTypeId;
  String _userType;
  int _customerTypeId;
  String _customerTypeName;
  String _firstName;
  String _lastName;
  String _email;
  dynamic _password;
  int _genderId;
  String _gender;
  int _countryId;
  String _countryName;
  String _city;
  dynamic _addressLine1;
  dynamic _addressLine2;
  String _phoneNumber;
  String _countryCode;
  String _profileImage;
  bool _isActive;
  String _active;
  bool _isDeleted;
  dynamic _createdBy;
  dynamic _updatedBy;
  dynamic _createdOn;
  dynamic _updatedOn;
  bool _isApproveByAdmin;
  dynamic _strApprovedByAdmin;
  bool _isDeactivated;
  dynamic _userList;
  dynamic _referredBy;
  dynamic _file;
  bool _success;
  dynamic _message;

  int get id => _id;
  int get userTypeId => _userTypeId;
  String get userType => _userType;
  int get customerTypeId => _customerTypeId;
  String get customerTypeName => _customerTypeName;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  dynamic get password => _password;
  int get genderId => _genderId;
  String get gender => _gender;
  int get countryId => _countryId;
  String get countryName => _countryName;
  String get city => _city;
  dynamic get addressLine1 => _addressLine1;
  dynamic get addressLine2 => _addressLine2;
  String get phoneNumber => _phoneNumber;
  String get countryCode => _countryCode;
  String get profileImage => _profileImage;
  bool get isActive => _isActive;
  String get active => _active;
  bool get isDeleted => _isDeleted;
  dynamic get createdBy => _createdBy;
  dynamic get updatedBy => _updatedBy;
  dynamic get createdOn => _createdOn;
  dynamic get updatedOn => _updatedOn;
  bool get isApproveByAdmin => _isApproveByAdmin;
  dynamic get strApprovedByAdmin => _strApprovedByAdmin;
  bool get isDeactivated => _isDeactivated;
  dynamic get userList => _userList;
  dynamic get referredBy => _referredBy;
  dynamic get file => _file;
  bool get success => _success;
  dynamic get message => _message;

  User({
      int id, 
      int userTypeId, 
      String userType, 
      int customerTypeId, 
      String customerTypeName, 
      String firstName, 
      String lastName, 
      String email, 
      dynamic password, 
      int genderId, 
      String gender, 
      int countryId, 
      String countryName, 
      String city, 
      dynamic addressLine1, 
      dynamic addressLine2, 
      String phoneNumber, 
      String countryCode, 
      String profileImage, 
      bool isActive, 
      String active, 
      bool isDeleted, 
      dynamic createdBy, 
      dynamic updatedBy, 
      dynamic createdOn, 
      dynamic updatedOn, 
      bool isApproveByAdmin, 
      dynamic strApprovedByAdmin, 
      bool isDeactivated, 
      dynamic userList, 
      dynamic referredBy, 
      dynamic file, 
      bool success, 
      dynamic message}){
    _id = id;
    _userTypeId = userTypeId;
    _userType = userType;
    _customerTypeId = customerTypeId;
    _customerTypeName = customerTypeName;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _password = password;
    _genderId = genderId;
    _gender = gender;
    _countryId = countryId;
    _countryName = countryName;
    _city = city;
    _addressLine1 = addressLine1;
    _addressLine2 = addressLine2;
    _phoneNumber = phoneNumber;
    _countryCode = countryCode;
    _profileImage = profileImage;
    _isActive = isActive;
    _active = active;
    _isDeleted = isDeleted;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
    _createdOn = createdOn;
    _updatedOn = updatedOn;
    _isApproveByAdmin = isApproveByAdmin;
    _strApprovedByAdmin = strApprovedByAdmin;
    _isDeactivated = isDeactivated;
    _userList = userList;
    _referredBy = referredBy;
    _file = file;
    _success = success;
    _message = message;
}

  User.fromJson(dynamic json) {
    _id = json["Id"];
    _userTypeId = json["UserTypeId"];
    _userType = json["UserType"];
    _customerTypeId = json["CustomerTypeId"];
    _customerTypeName = json["CustomerTypeName"];
    _firstName = json["FirstName"];
    _lastName = json["LastName"];
    _email = json["Email"];
    _password = json["Password"];
    _genderId = json["GenderId"];
    _gender = json["Gender"];
    _countryId = json["CountryId"];
    _countryName = json["CountryName"];
    _city = json["City"];
    _addressLine1 = json["AddressLine1"];
    _addressLine2 = json["AddressLine2"];
    _phoneNumber = json["PhoneNumber"];
    _countryCode = json["CountryCode"];
    _profileImage = json["ProfileImage"];
    _isActive = json["IsActive"];
    _active = json["Active"];
    _isDeleted = json["IsDeleted"];
    _createdBy = json["CreatedBy"];
    _updatedBy = json["UpdatedBy"];
    _createdOn = json["CreatedOn"];
    _updatedOn = json["UpdatedOn"];
    _isApproveByAdmin = json["IsApproveByAdmin"];
    _strApprovedByAdmin = json["strApprovedByAdmin"];
    _isDeactivated = json["IsDeactivated"];
    _userList = json["UserList"];
    _referredBy = json["ReferredBy"];
    _file = json["file"];
    _success = json["Success"];
    _message = json["Message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["UserTypeId"] = _userTypeId;
    map["UserType"] = _userType;
    map["CustomerTypeId"] = _customerTypeId;
    map["CustomerTypeName"] = _customerTypeName;
    map["FirstName"] = _firstName;
    map["LastName"] = _lastName;
    map["Email"] = _email;
    map["Password"] = _password;
    map["GenderId"] = _genderId;
    map["Gender"] = _gender;
    map["CountryId"] = _countryId;
    map["CountryName"] = _countryName;
    map["City"] = _city;
    map["AddressLine1"] = _addressLine1;
    map["AddressLine2"] = _addressLine2;
    map["PhoneNumber"] = _phoneNumber;
    map["CountryCode"] = _countryCode;
    map["ProfileImage"] = _profileImage;
    map["IsActive"] = _isActive;
    map["Active"] = _active;
    map["IsDeleted"] = _isDeleted;
    map["CreatedBy"] = _createdBy;
    map["UpdatedBy"] = _updatedBy;
    map["CreatedOn"] = _createdOn;
    map["UpdatedOn"] = _updatedOn;
    map["IsApproveByAdmin"] = _isApproveByAdmin;
    map["strApprovedByAdmin"] = _strApprovedByAdmin;
    map["IsDeactivated"] = _isDeactivated;
    map["UserList"] = _userList;
    map["ReferredBy"] = _referredBy;
    map["file"] = _file;
    map["Success"] = _success;
    map["Message"] = _message;
    return map;
  }

}