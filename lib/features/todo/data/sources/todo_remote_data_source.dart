import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../lib.dart';

abstract class TodoRemoteDataSource {
  Future getTodos();
  Future addTodo(TodoModel todo);
  Future updateTodo(TodoModel todo);
  Future deleteTodo(String id);
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final FirebaseFirestore firestore;
  final String uid;

  TodoRemoteDataSourceImpl({required this.firestore, required this.uid});

  @override
  Future<List<TodoModel>> getTodos() async {
    try {
      final snapshot = await firestore
          .collection('users')
          .doc(uid)
          .collection('todos')
          .get();
      final todos =
          snapshot.docs.map((doc) => TodoModel.fromJson(doc.data())).toList();
      return todos;
    } catch (e) {
      throw Exception('Failed to get todos: $e');
    }
  }

  @override
  Future<void> addTodo(TodoModel todo) async {
    try {
      await firestore
          .collection('users')
          .doc(uid)
          .collection('todos')
          .add(todo.toJson());
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
          .collection('todos')
          .doc(todo.id)
          .update(todo.toJson());
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
          .collection('todos')
          .doc(id)
          .delete();
    } catch (e) {
      throw Exception('Failed to delete todo: $e');
    }
  }
}
