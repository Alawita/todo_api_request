import 'package:dio/dio.dart';
import 'package:todo_api_app/models/user.dart';
import 'package:todo_api_app/services/client.dart';

class AuthService {
  Future<String> signup({required User user}) async {
    late String token;
    try {
      if (user.username.isNotEmpty && user.password.isNotEmpty) {
        final Response responese =
            await ApiClient.dio.post("/signup", data: user.toJson());
        return token = responese.data["token"];
      } else
        return "";
    } catch (e) {
      throw "password or username invalid";
    }
  }

  Future signin({required User user}) async {
    late String token;
    try {
      final Response responese =
          await ApiClient.dio.post("/signin", data: user.toJson());
      return token = responese.data["token"];
    } catch (e) {
      throw "password or username invalid";
    }
  }
}
