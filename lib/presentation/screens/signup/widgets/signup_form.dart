import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/config/constants.dart';
import 'package:todo/config/size_config.dart';
import 'package:todo/logic/bloc/registration_bloc.dart';
import 'package:todo/main.dart';
import 'package:todo/presentation/screens/home/home_screen.dart';
import 'package:todo/presentation/widgets/default_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String _userName = '';
  late String _email = '';
  late String _password = '';
  late String _confirmPassword = '';

  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildConfirmPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            widget: BlocConsumer<RegistrationBloc, RegistrationState>(
              builder: (context, state) {
                if (state is RegistrationInitial) {
                  return const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else if (state is RegistrationLoading) {
                  return const CircularProgressIndicator(
                    color: Colors.white,
                  );
                } else if (state is RegistrationFailure) {
                  return AlertDialog(
                    content: Text(state.errorMessage),
                  );
                }
                return Container();
              },
              listener: (context, state) {
                if (state is RegistrationSuccess) {
                  navigateToHomeScreen(context);
                }
              },
            ),
            press: () {
              if (!_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                BlocProvider.of<RegistrationBloc>(context).add(
                  SignupButtonPressed(_email, _password, _userName),
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

  TextFormField buildNameFormField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(
        labelText: "Username",
      ),
      onSaved: (value) => _userName = value!,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(emailFocusNode);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return kNameNullError;
        }
        return null;
      },
    );
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
      textInputAction: TextInputAction.next,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Password",
      ),
      onSaved: (value) => _password = value!,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(confirmPasswordFocusNode);
      },
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

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Confirm Password",
      ),
      onSaved: (value) => _confirmPassword = value!,
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        } else if (_password != value) {
          return kMatchPassError;
        }
        return null;
      },
    );
  }
}
