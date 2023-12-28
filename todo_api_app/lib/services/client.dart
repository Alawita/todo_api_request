import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_api_app/models/todo_model.dart';

final booksURL = "https://coded-books-api-auth.eapi.joincoded.com";
final todoURL = "https://calm-plum-jaguar-tutu.cyclic.app";

class ApiClient {
  static final Dio dio = Dio(BaseOptions(baseUrl: booksURL));

  static Future<void> addAuthToken() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    String? token = shared.getString('token');

    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  static Future<Response> get(String path) async {
    await addAuthToken();
    try {
      print(dio.options.headers['Authorization'].toString());
      return await dio.get(path);
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<Response> post(String path, {Object? data}) async {
    await addAuthToken();
    try {
      return await dio.get(path, data: data);
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<Response> put(String path, {Object? data}) async {
    await addAuthToken();
    try {
      return await dio.put(path, data: data);
    } catch (error) {
      throw error.toString();
    }
  }
}

class NamedRoutes {
  static final String login = "signin";
}









// class NamedRoutes {
//   final String login = "/login";
// }
