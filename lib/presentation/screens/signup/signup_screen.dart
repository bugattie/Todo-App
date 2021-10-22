import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/repositories/user_repositories.dart';
import 'package:todo/logic/bloc/registration_bloc.dart';

import './widgets/body.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signup';
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late UserRepository userRepository = context.read<UserRepository>();
    return BlocProvider(
      create: (context) => RegistrationBloc(userRepository: userRepository),
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
