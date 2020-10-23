// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.login,
    this.password,
    this.token,
  });

  String login;
  String password;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        login: json["login"] == null ? null : json["login"],
        password: json["password"] == null ? null : json["password"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "login": login == null ? null : login,
        "password": password == null ? null : password,
        "token": token == null ? null : token,
      };
}
