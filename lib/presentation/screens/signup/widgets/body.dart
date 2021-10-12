import 'package:flutter/material.dart';
import 'package:todo/config/constants.dart';
import 'package:todo/config/size_config.dart';
import 'package:todo/presentation/screens/login/login_screen.dart';
import 'package:todo/presentation/screens/signup/widgets/signup_form.dart';
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
              'Create Account',
              style: headingStyle,
            ),
            AccountText(
              text: "Already have an account?",
              action: "Sign In!",
              press: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: getProportionateScreenHeight(45)),
            const SignUpForm(),
            SizedBox(height: getProportionateScreenHeight(45)),
          ],
        ),
      ),
    );
  }
}
