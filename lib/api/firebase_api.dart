// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:tick_to_do/model/todo.dart';

// String uid = FirebaseAuth.instance.currentUser!.uid;

// class FirebaseApi {
//   static Future<String> createTodo(Todo todo) async {
//     final docTodo = FirebaseFirestore.instance
//         .collection('users')
//         .doc(uid)
//         .collection('todo')
//         .doc();

//     todo.id = docTodo.id;
//     await docTodo.set(todo.toJson());

//     return docTodo.id;
//   }

//   // static Stream<List<Todo>> readTodos() => FirebaseFirestore.instance
//   //     .collection('users')
//   //     .doc(uid)
//   //     .collection('todo')
//   //     .orderBy(TodoField.createdTime, descending: true)
//   //     .snapshots()
//   //     .transform(Utils.transformer(Todo.fromJson).cast());

//   static Future updateTodo(Todo todo) async {
//     final docTodo = FirebaseFirestore.instance
//         .collection('users')
//         .doc(uid)
//         .collection('todo')
//         .doc(todo.id);

//     await docTodo.update(todo.toJson());
//   }

//   static Future deleteTodo(Todo todo) async {
//     final docTodo = FirebaseFirestore.instance
//         .collection('users')
//         .doc(uid)
//         .collection('todo')
//         .doc(todo.id);
//     await docTodo.delete();
//   }
// }
