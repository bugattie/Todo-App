import 'package:flutter/material.dart';

import './widgets/body.dart';

class AddTodoScreen extends StatelessWidget {
  static const routeName = '/add-todo';
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: TextButton(
              onPressed: () {
                // ...
              },
              child: const Text(
                'Add Todo',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: const Body(),
    );
  }
}
