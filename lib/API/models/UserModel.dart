// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromMap(Map<String, dynamic> map) => UserModel.fromJson(map);

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  String mail;
  String firstname;
  String lastname;
  double balance;

  UserModel({
    required this.id,
    required this.mail,
    required this.firstname,
    required this.lastname,
    required this.balance,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    mail: json["mail"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    balance: json["balance"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mail": mail,
    "firstname": firstname,
    "lastname": lastname,
    "balance": balance,
  };
}
