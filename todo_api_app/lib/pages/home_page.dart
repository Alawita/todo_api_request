import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_api_app/providers/auth_provider.dart';
import 'package:todo_api_app/providers/todo_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).push("/add");
              },
              icon: Icon(Icons.add)),
          ElevatedButton(
              onPressed: () => context.read<AuthProvider>().logOut(),
              child: Text("logout"))
        ],
      ),
      body: FutureBuilder(
          future: context.read<TodoProvider>().getTodoList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LinearProgressIndicator(),
              );
            }
            return Consumer<TodoProvider>(
                builder: (context, value, child) => ListView.builder(
                    itemCount: value.todoList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: IconButton(
                            onPressed: () {
                              context
                                  .read<TodoProvider>()
                                  .deleteTodo(value.todoList[index].id);
                            },
                            icon: Icon(Icons.delete)),
                        title: Text("${value.todoList[index].todoName}"),
                        subtitle:
                            Text(value.todoList[index].createdAt.toString()),
                        trailing: Checkbox(
                            value: value.todoList[index].isComplete,
                            onChanged: (check) => {
                                  context.read<TodoProvider>().updateTodo(
                                      value.todoList[index].id, check)
                                }),
                      );
                    }));
          }),
    );
  }
}
