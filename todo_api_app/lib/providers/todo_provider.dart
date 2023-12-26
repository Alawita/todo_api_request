import 'package:flutter/material.dart';
import 'package:todo_api_app/models/todo_model.dart';
import 'package:todo_api_app/services/todo_service.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todoList = [];

  final TodoService _todoService = TodoService();

  Future<void> getTodoList() async {
    todoList = await _todoService.getTodoListApi();

    notifyListeners();
  }
}
