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

  createNewTodo(String todoName, bool? isComplete) async {
    await _todoService.creatTedo(todoName, isComplete);
    getTodoList();
    //notifyListeners();
  }

  updateTodo(String id, bool? isComplete) async {
    await _todoService.updateTedo(id, isComplete);
    getTodoList();
    // notifyListeners();
  }

  deleteTodo(String id) async {
    await _todoService.deleteTodo(id);

    getTodoList();
    // notifyListeners();
  }
}
