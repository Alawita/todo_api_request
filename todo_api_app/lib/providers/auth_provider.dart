import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    saveTokenInStorage(token);
    notifyListeners();
    return token;
  }

  Future<void> saveTokenInStorage(String token) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString("token", token);
  }

  Future<void> readTokenInStorage() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    token = shared.getString("token") ??
        ""; // ?? null check oporator:used like an if statement
    notifyListeners();
  }

  Future<void> logOut() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString("token", "");
    token = "";
    notifyListeners();
  }
}
