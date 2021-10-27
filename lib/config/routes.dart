import 'package:flutter/widgets.dart';
import 'package:todo/presentation/screens/add_todo/add_todo.dart';
import 'package:todo/presentation/screens/login/login_screen.dart';
import 'package:todo/presentation/screens/home/home_screen.dart';
import 'package:todo/presentation/screens/signup/signup_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  AddTodoScreen.routeName: (context) => AddTodoScreen(),
};
