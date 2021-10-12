import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:todo/config/constants.dart';
import 'package:todo/config/size_config.dart';
import 'package:todo/presentation/screens/login/widgets/login_form.dart';
import 'package:todo/presentation/screens/signup/signup_screen.dart';
import 'package:todo/presentation/widgets/account_text.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(45)),
            Text(
              'Sign In',
              style: headingStyle,
            ),
            AccountText(
              text: "Dont't have an account?",
              action: "Sign Up!",
              press: () {
                Navigator.pushNamed(context, SignUpScreen.routeName);
              },
            ),
            SizedBox(height: getProportionateScreenHeight(45)),
            const LoginForm(),
            SizedBox(height: getProportionateScreenHeight(45)),
          ],
        ),
      ),
    );
  }
}
