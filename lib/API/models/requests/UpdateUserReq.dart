import 'dart:convert';

String updateUserReqToJson(UpdateUserReq data) => json.encode(data.toJson());

class UpdateUserReq {
  String firstname;
  String lastname;
  String password;

  UpdateUserReq({
    required this.firstname,
    required this.lastname,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "password": password,
  };
}
