// import 'package:cloud_firestore/cloud_firestore.dart';

// class TodoField {
//   static const createdTime = 'createdTime';
// }

// class Todo {
//   DateTime? createdTime;
//   String title;
//   String id;
//   String description;
//   bool isDone;

//   Todo({
//     required this.createdTime,
//     required this.title,
//     required this.id,
//     this.description = '',
//     this.isDone = false,
//   });

//   static Todo fromJson(Map<String, dynamic> json) => Todo(
//         createdTime: (json['createdTime'] as Timestamp?)?.toDate(),
//         title: json['title'],
//         description: json['description'],
//         id: json['id'],
//         isDone: json['isDone'],
//       );

//   Map<String, dynamic> toJson() => {
//         'createdTime': createdTime?.toUtc(),
//         'title': title,
//         'description': description,
//         'id': id,
//         'isDone': isDone,
//       };
// }
