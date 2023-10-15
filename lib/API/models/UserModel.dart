// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  String mail;
  String firstname;
  String lastname;
  String password;
  int balance;

  UserModel({
    required this.id,
    required this.mail,
    required this.firstname,
    required this.lastname,
    required this.password,
    required this.balance,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    mail: json["mail"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    password: json["password"],
    balance: json["balance"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mail": mail,
    "firstname": firstname,
    "lastname": lastname,
    "password": password,
    "balance": balance,
  };
}
