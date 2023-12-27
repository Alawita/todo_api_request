import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_api_app/providers/auth_provider.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: context.read<AuthProvider>().readTokenInStorage(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("token : ${context.read<AuthProvider>().token}");
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // Check if the token is not empty after readTokenInStorage completes
          if (context.watch<AuthProvider>().token.isNotEmpty) {
            GoRouter.of(context).go("/homepage");
          } else {
            GoRouter.of(context).go("/signup");
          }

          return SizedBox();
        },
      ),
    );
  }
}
