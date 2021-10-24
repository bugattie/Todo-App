import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/config/constants.dart';
import 'package:todo/data/repositories/user_repositories.dart';
import 'package:todo/presentation/screens/add_todo/add_todo.dart';
import 'package:todo/presentation/screens/login/login_screen.dart';
import './widgets/body.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: kPrimaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
          actions: [
            IconButton(
              onPressed: () {
                context.read<UserRepository>().signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.routeName, (route) => false);
              },
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
            ),
          ],
        ),
        body: const Body(),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add Todo',
          onPressed: () {
            Navigator.pushNamed(context, AddTodoScreen.routeName);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
