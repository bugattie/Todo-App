import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Body extends StatefulWidget {
  final GlobalKey formKey;
  String desc;
  Body(this.desc, {Key? key, required this.formKey}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Form(
        key: widget.formKey,
        child: TextFormField(
          autofocus: true,
          textInputAction: TextInputAction.done,
          textCapitalization: TextCapitalization.sentences,
          maxLines: 4,
          onSaved: (value) {
            setState(() {
              widget.desc = value!;
            });
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please write a description';
            }
            return null;
          },
          decoration: const InputDecoration(
            hintText: 'Write your task description',
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
