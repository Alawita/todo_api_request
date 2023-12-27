import 'package:flutter/material.dart';
import 'package:todo_api_app/models/user.dart';
import 'package:todo_api_app/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  String token = "";

  Future<String> signup({required User user}) async {
    token = await AuthService().signup(user: user);
    notifyListeners();
    return token;
  }

  /// api verify token

  Future<String> signin({required User user}) async {
    token = await AuthService().signin(user: user);

    notifyListeners();
    return token;
  }
}
