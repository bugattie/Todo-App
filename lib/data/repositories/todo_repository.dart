import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/data/models/todo.dart';

final CollectionReference todoCollection =
    FirebaseFirestore.instance.collection('Todos');

class TodoRepository {
  Future<void> addTodo(String uid, TodoModel todo) async {
    return await todoCollection
        .doc(uid)
        .collection('userTodo')
        .doc()
        .set(todo.toJson());
  }

  Stream<List<TodoModel>> requestTodoStream(String uid) {
    return todoCollection
        .doc(uid)
        .collection('userTodo')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => TodoModel.fromEntity(TodoModel.fromJson(doc)))
          .toList();
    });
  }
}
