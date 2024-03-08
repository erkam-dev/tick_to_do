part of 'todo_bloc.dart';

@freezed
class TodoEvent with _$TodoEvent {
  const factory TodoEvent.addTodoItem(Todo todo) = _AddTodoItem;
  const factory TodoEvent.updateTodoItem(Todo todo) = _UpdateTodoItem;
  const factory TodoEvent.deleteTodoItem(String id) = _DeleteTodoItem;
}
