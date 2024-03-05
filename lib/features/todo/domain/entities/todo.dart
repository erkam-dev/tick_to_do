import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
abstract class Todo with _$Todo {
  const Todo._();
  const factory Todo({
  required DateTime? createdTime,
  required String title,
  required String id,
  required String description,
  required bool isDone,
  }) = _Todo;
}
