import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../lib.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const Todo._();
  const factory Todo({
    required DateTime? createdTime,
    required String title,
    required String id,
    required String description,
    required bool isDone,
  }) = _Todo;

  factory Todo.fromModel(TodoModel model) => Todo(
        title: model.title ?? '',
        description: model.description ?? '',
        isDone: model.isDone ?? false,
        createdTime: model.createdTime,
        id: model.id ?? UniqueKey().toString(),
      );
}
