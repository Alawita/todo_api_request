import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_api_app/pages/add_todo.dart';
import 'package:todo_api_app/pages/home_page.dart';
import 'package:todo_api_app/pages/signin.dart';
import 'package:todo_api_app/pages/signup.dart';
import 'package:todo_api_app/pages/splash.dart';
import 'package:todo_api_app/providers/auth_provider.dart';
import 'package:todo_api_app/providers/todo_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TodoProvider()),
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
    )
  ], child: MyApp()));
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/homepage',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/add',
      builder: (BuildContext context, GoRouterState state) {
        return AddTodoPage();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return SignUpPage();
      },
    ),
    GoRoute(
      path: '/signin',
      builder: (BuildContext context, GoRouterState state) {
        return SignInPage();
      },
    ),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return SplashScreen();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
