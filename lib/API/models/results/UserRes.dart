import 'dart:convert';

import 'package:imt_framework_front/API/models/UserModel.dart';

UserRes userResFromJson(String str) => UserRes.fromJson(json.decode(str));

class UserRes {
  UserModel user;
  String jwt;

  UserRes({
    required this.user,
    required this.jwt,
  });

  factory UserRes.fromJson(Map<String, dynamic> json) => UserRes(
        user: userModelFromMap(Map.from(json["user"])),
        jwt: json["jwt"],
      );
}
