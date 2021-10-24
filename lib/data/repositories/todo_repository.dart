import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/data/models/todo.dart';

final CollectionReference todoCollection =
    FirebaseFirestore.instance.collection('Todos');

class TodoRepository {
  static Future<void> addTodo(String uid, TodoModel todo) async {
    return await todoCollection
        .doc(uid)
        .collection('userTodo')
        .doc()
        .set(todo.toJson());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> requestTodoStream(
      String uid) {
    return todoCollection.doc(uid).collection('userTodo').snapshots();
  }
}
