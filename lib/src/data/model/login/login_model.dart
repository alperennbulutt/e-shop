// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.message,
  });

  Message? message;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message!.toJson(),
      };
}

class Message {
  Message({
    this.token,
    this.tokenType,
    this.experiesAt,
    this.success,
  });

  String? token;
  String? tokenType;
  DateTime? experiesAt;
  String? success;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        token: json["token"],
        tokenType: json["token_type"],
        experiesAt: DateTime.parse(json["experies_at"]),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "token_type": tokenType,
        "experies_at": experiesAt!.toIso8601String(),
        "success": success,
      };
}
