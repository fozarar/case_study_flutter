import 'package:flutter/cupertino.dart';

class UserModel with ChangeNotifier {
  String? userId;
  String? email;

  UserModel({
    this.userId,
    this.email,
  });

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      userId: json['userId'],
      email: json['email'],
    );
  }
}
