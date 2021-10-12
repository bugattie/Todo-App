import 'package:flutter/material.dart';

import 'package:todo/config/constants.dart';

class AccountText extends StatelessWidget {
  final String text, action;
  final Function press;
  const AccountText({
    Key? key,
    required this.text,
    required this.action,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () {
            press();
          },
          child: Text(
            action,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
