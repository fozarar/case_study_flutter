import 'dart:convert';
import 'package:case_study/models/login_model.dart';
import 'package:case_study/models/response_model.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
  ResponseModel? responseModel;
  bool _isLoggedIn = false;
  bool get isLoggedIn {
    return _isLoggedIn;
  }

  Future<ResponseModel?> login(LoginModel loginModel) async {
    final url = Uri.parse(
        "https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/login");
    try {
      final response = await http.post(
        url,
        body: {
          'email': loginModel.email,
          'password': loginModel.password,
        },
      );

      final extractedData = json.decode(response.body);

      print("//// LOGIN response: $extractedData");

      _isLoggedIn = true;
      responseModel = ResponseModel.fromJson(extractedData);

      notifyListeners();

      return responseModel;
    } catch (error) {
      _isLoggedIn = false;
      notifyListeners();
      print(error);
      rethrow;
    }
  }
}
