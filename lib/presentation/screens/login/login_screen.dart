import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo/config/constants.dart';
import 'package:todo/config/size_config.dart';
import 'package:todo/data/repositories/user_repositories.dart';
import 'package:todo/logic/bloc/login_bloc.dart';
import 'package:todo/presentation/screens/login/widgets/body.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: kBackground,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    SizeConfig().init(context);
    late UserRepository userRepository = context.read<UserRepository>();
    return BlocProvider(
      create: (create) => LoginBloc(userRepository: userRepository),
      child: Builder(
        builder: (context) => const SafeArea(
          child: Scaffold(
            body: Body(),
          ),
        ),
      ),
    );
  }
}
