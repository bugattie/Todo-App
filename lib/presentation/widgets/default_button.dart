import 'package:flutter/material.dart';

import 'package:todo/config/constants.dart';

class DefaultButton extends StatelessWidget {
  final Widget widget;
  final Function press;
  const DefaultButton({
    Key? key,
    required this.widget,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          press();
        },
        style: ElevatedButton.styleFrom(
          primary: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: widget,
      ),
    );
  }
}
