import 'package:dio/dio.dart';
import 'package:todo_api_app/models/todo_model.dart';

class TodoService {
  final String serverUrl = "https://calm-plum-jaguar-tutu.cyclic.app/todos";
  final _dio = Dio();

  Future<List<Todo>> getTodoListApi() async {
    try {
      Response<dynamic> responseValue = await _dio.get(serverUrl);
      if (responseValue.statusCode == 200) {
        // List list = responseValue.data['data'];
        final TodoModel todoModel = TodoModel.fromJson(responseValue.data);
        return todoModel.data;
      }
      return [];
    } catch (e) {
      //throw e.toString();
      throw e.toString();
    }
  }

  creatTedo(String todoName, bool? isComplete) async {
    try {
      final response = await _dio.post(serverUrl,
          data: {"todoName": todoName, "isComplete": isComplete});
      return response.data;
    } catch (e) {
      throw "Error";
    }
  }

  updateTedo(String id, bool? isComplete) async {
    try {
      final response =
          await _dio.put(serverUrl + "/$id", data: {"isComplete": isComplete});
      return response.data;
    } catch (e) {
      throw "Error";
    }
  }

  deleteTodo(String id) async {
    try {
      final response = await _dio.delete(serverUrl + "/$id");
      return response.data;
    } catch (e) {
      throw "error";
    }
  }
}
