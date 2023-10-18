import 'dart:convert';

String userResToJson(AuthModelReq data) => json.encode(data.toJson());

class AuthModelReq {
  String mail;
  String password;

  AuthModelReq({
    required this.mail,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "mail": mail,
        "password": password,
      };
}
