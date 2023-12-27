import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_api_app/models/user.dart';
import 'package:todo_api_app/providers/auth_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Perform sign-up logic here
                  final User user = User(
                      username: _usernameController.text,
                      password: _passwordController.text);
                  context.read<AuthProvider>().signin(user: user).then((token) {
                    if (token.isNotEmpty) {
                      GoRouter.of(context).go("/homepage");
                    }
                    // Example: Print the username and password}
                  });
                },
                child: Text('Sign In'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Perform sign-up logic here
                  GoRouter.of(context).go("/");
                },
                child: Text('make new user'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
