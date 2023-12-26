import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_api_app/providers/todo_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: context.read<TodoProvider>().getTodoList(),
          builder: (context, snapshot) {
            return Consumer<TodoProvider>(
                builder: (context, value, child) => ListView.builder(
                    itemCount: value.todoList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            "${value.todoList[index].todoName} Date created: ${value.todoList[index].createdAt.toString()}"),
                        subtitle:
                            Text(value.todoList[index].isComplete.toString()),
                      );
                    }));
          }),
    );
  }
}
