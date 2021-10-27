import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String text;

  const TodoModel({required this.text});

  static TodoModel fromEntity(TodoModel todoModel) {
    return TodoModel(text: todoModel.text);
  }

  TodoModel.fromJson(DocumentSnapshot json) : text = json['text'];

  Map<String, dynamic> toJson() => {
        'text': text,
      };

  @override
  List<Object?> get props => [text];

  TodoModel copyWith({
    String? text,
  }) {
    return TodoModel(
      text: text ?? this.text,
    );
  }

  @override
  String toString() {
    return 'Todo { text: $text }';
  }
}
