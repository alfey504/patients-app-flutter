import 'package:flutter/foundation.dart';

class LoginData {
  final int userId;
  final String userName;
  final String email;
  final String token;

  LoginData(
      {required this.userId,
      required this.userName,
      required this.email,
      required this.token});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
        userId: json["userId"],
        userName: json['userName'],
        email: json['email'],
        token: json['token']);
  }
}

class LoginResponse {
  final int success;
  final String message;
  final List<LoginData> loginData;

  LoginResponse(
      {required this.success, required this.message, required this.loginData});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    print("sudalamani");
    List<dynamic> loginDataJson = json['data'];
    List<LoginData> loginData;

    if (json['success'] == 1) {
      loginData = loginDataJson.map((login) {
        return LoginData.fromJson(login);
      }).toList();
    } else {
      loginData = List.empty();
    }

    print(loginData);

    return LoginResponse(
        success: json['success'],
        message: json['message'],
        loginData: loginData);
  }
}
