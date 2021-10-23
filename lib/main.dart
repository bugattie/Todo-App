import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todo/config/constants.dart';

import 'package:todo/config/routes.dart';
import 'package:todo/config/theme.dart';
import 'package:todo/data/repositories/user_repositories.dart';
import 'package:todo/logic/bloc/auth_bloc.dart';
import 'package:todo/logic/utils/app_bloc_observer.dart';
import 'package:todo/presentation/screens/home/home_screen.dart';
import 'package:todo/presentation/screens/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = AppBlocOberserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final UserRepository _userRepository = UserRepository(null);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _userRepository,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo',
        theme: theme(context),
        // initialRoute: LoginScreen.routeName,
        // routes: routes,
        home: BlocProvider(
          create: (context) =>
              AppBloc(userRepository: _userRepository)..add(AppStartedEvent()),
          child: BlocBuilder<AppBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthInitialState) {
                return const SplashScreen();
              } else if (state is AuthenticatedState) {
                return const HomeScreen();
              } else {
                return const LoginScreen();
              }
            },
          ),
        ),
        routes: routes,
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
