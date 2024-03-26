part of 'todo_bloc.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState.initial([
    List<Todo>? todos,
    List<Todo>? completed,
  ]) = _Initial;
  const factory TodoState.loading() = _Loading;
  const factory TodoState.error() = _Error;
}
