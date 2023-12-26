import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_api_app/providers/todo_provider.dart';

class AddTodoPage extends StatefulWidget {
  AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final _todoController = TextEditingController();
  bool isComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(controller: _todoController),
            SizedBox(
              height: 10,
              child: Checkbox(
                  value: isComplete,
                  onChanged: (value) => {
                        setState(() {
                          isComplete = value!;
                        })
                      }),
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<TodoProvider>()
                      .createNewTodo(_todoController.text, isComplete);
                  GoRouter.of(context).pop();
                },
                child: Text("add todo"))
          ],
        ),
      ),
    );
  }
}
