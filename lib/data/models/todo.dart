import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  final String text;

  TodoModel({required this.text});

  TodoModel.fromJson(DocumentSnapshot json) : text = json['text'];

  Map<String, dynamic> toJson() => {
        'text': text,
      };
}
