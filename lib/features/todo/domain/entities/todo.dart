import 'package:flutter/material.dart';

import '../../../../lib.dart';

class Todo {
  final DateTime? createdTime;
  final String title;
  final String id;
  final String description;
  final bool isDone;

  Todo({
    required this.createdTime,
    required this.title,
    required this.id,
    required this.description,
    required this.isDone,
  });

  Todo copyWith({
    DateTime? createdTime,
    String? title,
    String? id,
    String? description,
    bool? isDone,
  }) {
    return Todo(
      createdTime: createdTime ?? this.createdTime,
      title: title ?? this.title,
      id: id ?? this.id,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  factory Todo.fromModel(TodoModel model) => Todo(
        title: model.title ?? '',
        description: model.description ?? '',
        isDone: model.isDone ?? false,
        createdTime: model.createdTime,
        id: model.id ?? UniqueKey().toString(),
      );
}
