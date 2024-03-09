import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../lib.dart';

abstract class TodoRemoteDataSource {
  Stream<List<TodoModel>> getTodoStream();
  Future addTodo(TodoModel todo);
  Future updateTodo(TodoModel todo);
  Future deleteTodo(String id);
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final FirebaseFirestore firestore;
  final String uid;

  TodoRemoteDataSourceImpl({required this.firestore, required this.uid});

  @override
  Stream<List<TodoModel>> getTodoStream() {
    return firestore
        .collection('users')
        .doc(uid)
        .collection('todo')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TodoModel.fromJson(doc.data()))
            .toList());
  }

  @override
  Future<void> addTodo(TodoModel todo) async {
    try {
      var docTodo =
          firestore.collection('users').doc(uid).collection('todo').doc();
      todo = todo.copyWith(id: docTodo.id);
      await docTodo.set(todoModelToJson(todo));
    } catch (e) {
      throw Exception('Failed to add todo: $e');
    }
  }

  @override
  Future<void> updateTodo(TodoModel todo) async {
    try {
      await firestore
          .collection('users')
          .doc(uid)
          .collection('todo')
          .doc(todo.id)
          .update(todoModelToJson(todo));
    } catch (e) {
      throw Exception('Failed to update todo: $e');
    }
  }

  @override
  Future<void> deleteTodo(String id) async {
    try {
      await firestore
          .collection('users')
          .doc(uid)
          .collection('todo')
          .doc(id)
          .delete();
    } catch (e) {
      throw Exception('Failed to delete todo: $e');
    }
  }
}
