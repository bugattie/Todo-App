import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:todo/config/routes.dart';
import 'package:todo/config/theme.dart';
import 'package:todo/presentation/screens/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: theme(context),
      initialRoute: LoginScreen.routeName,
      routes: routes,
    );
  }
}
