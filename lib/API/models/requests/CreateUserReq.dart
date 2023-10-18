import 'dart:convert';

String createUserReqToJson(CreateUserReq data) => json.encode(data.toJson());

class CreateUserReq {
  String mail;
  String firstname;
  String lastname;
  String password;

  CreateUserReq({
    required this.mail,
    required this.firstname,
    required this.lastname,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "mail": mail,
        "firstname": firstname,
        "lastname": lastname,
        "password": password,
      };
}
