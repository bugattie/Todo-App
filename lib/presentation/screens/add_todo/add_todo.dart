import 'package:flutter/material.dart';

import './widgets/body.dart';

class AddTodoScreen extends StatelessWidget {
  static const routeName = '/add-todo';
  AddTodoScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  late String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print('Check $_description');
                }
              },
              child: const Text(
                'Add Todo',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: Body(_description, formKey: _formKey),
    );
  }
}
