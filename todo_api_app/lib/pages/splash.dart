import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_api_app/providers/auth_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: context.read<AuthProvider>().readTokenInStorage(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data.toString().isNotEmpty) {
              GoRouter.of(context).go("/homepage");
            } else {
              GoRouter.of(context).go("/signup");
            }

            return SizedBox();
          }),
    );
  }
}
