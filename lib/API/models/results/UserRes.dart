import 'dart:convert';
import 'package:imt_framework_front/API/models/UserModel.dart';


UserRes userResFromJson(String str) => UserRes.fromJson(json.decode(str));
Map<String, dynamic> test(String str) => json.decode(str);

class UserRes {
  //UserModel user;
  String user;
  String jwt;

  UserRes({
    required this.user,
    required this.jwt,
  });

  factory UserRes.fromJson(Map<String, dynamic> jsonRes) => UserRes(
    //user: userModelFromJson(json.decode(jsonRes["user"])),
    user: jsonRes["user"],
    jwt: jsonRes["jwt"],
  );
}
