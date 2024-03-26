import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../lib.dart';

abstract class TodoRemoteDataSource {
  Stream<List<TodoModel>> getTodoStream();
  Future addTodo(TodoModel todo);
  Future updateTodo(TodoModel todo);
  Future deleteTodo(String id);
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final FirebaseFirestore firestore;

  TodoRemoteDataSourceImpl({required this.firestore});

  @override
  Stream<List<TodoModel>> getTodoStream() {
    String? uid = sl<FirebaseAuth>().currentUser?.uid;
    if (uid != null) {
      return firestore
          .collection('users')
          .doc(uid)
          .collection('todo')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => TodoModel.fromJson(doc.data()))
              .toList());
    } else {
      return const Stream.empty();
    }
  }

  @override
  Future<void> addTodo(TodoModel todo) async {
    String? uid = sl<FirebaseAuth>().currentUser?.uid;
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
    String? uid = sl<FirebaseAuth>().currentUser?.uid;
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
    String? uid = sl<FirebaseAuth>().currentUser?.uid;
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
