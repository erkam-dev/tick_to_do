import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../lib.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    DateTime? createdTime,
    String? title,
    String? id,
    String? description,
    bool? isDone,
  }) = _TodoModel;

  factory TodoModel.fromEntity(Todo todo) => TodoModel(
        title: todo.title,
        description: todo.description,
        isDone: todo.isDone,
        createdTime: todo.createdTime,
        id: todo.id,
      );

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}
