import 'dart:convert';

String authUserReqToJson(AuthUserReq data) => json.encode(data.toJson());

class AuthUserReq {
  String mail;
  String password;

  AuthUserReq({
    required this.mail,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "mail": mail,
        "password": password,
      };
}
