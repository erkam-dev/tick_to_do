import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../lib.dart';

class TodoModel {
  final DateTime? createdTime;
  final String? title;
  final String? id;
  final String? description;
  final bool? isDone;

  TodoModel({
    this.createdTime,
    this.title,
    this.id,
    this.description,
    this.isDone,
  });

  TodoModel copyWith({
    DateTime? createdTime,
    String? title,
    String? id,
    String? description,
    bool? isDone,
  }) {
    return TodoModel(
      createdTime: createdTime ?? this.createdTime,
      title: title ?? this.title,
      id: id ?? this.id,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  factory TodoModel.fromEntity(Todo todo) => TodoModel(
        title: todo.title,
        description: todo.description,
        isDone: todo.isDone,
        createdTime: todo.createdTime,
        id: todo.id,
      );

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        createdTime: (json['createdTime'] as Timestamp?)?.toDate(),
        title: json['title'],
        description: json['description'],
        id: json['id'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() {
    return {
      'createdTime': createdTime?.toUtc(),
      'title': title,
      'description': description,
      'id': id,
      'isDone': isDone,
    };
  }
}
