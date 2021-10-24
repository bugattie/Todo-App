import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo/config/constants.dart';
import 'package:todo/config/size_config.dart';
import 'package:todo/logic/bloc/login_bloc.dart';
import 'package:todo/presentation/screens/home/home_screen.dart';
import 'package:todo/presentation/widgets/default_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late String _email = '';
  late String _password = '';

  late FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Forgot Password?",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            widget: BlocConsumer<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginInitial) {
                  return const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else if (state is LoginLoading) {
                  return const CircularProgressIndicator(
                    color: Colors.white,
                  );
                } else if (state is LoginFailure) {
                  return AboutDialog(
                    children: [Text(state.errorMessage)],
                  );
                }
                return Container();
              },
              listener: (context, state) {
                if (state is LoginSuccess) {
                  navigateToHomeScreen(context);
                }
              },
            ),
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                BlocProvider.of<LoginBloc>(context).add(
                  LogInButtonPressed(_email, _password),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void navigateToHomeScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "Email",
      ),
      onSaved: (value) => _email = value!,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(passwordFocusNode);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        labelText: "Password",
      ),
      onSaved: (value) => _password = value!,
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        } else if (value.length < 8) {
          return kShortPassError;
        }
        return null;
      },
    );
  }
}
