import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tick_to_do/common/value_notifier_list.dart';
import 'package:tick_to_do/core/core.dart';
import 'package:tick_to_do/features/features.dart';

part 'todo_bloc.freezed.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  ValueNotifierList<Todo> selectedTodos = ValueNotifierList([]);
  Todo newTodo = sl<Todo>();
  final GetTodoStreamUsecase getTodoStreamUsecase;
  final AddTodoUsecase addTodoUsecase;
  final UpdateTodoUsecase updateTodoUsecase;
  final DeleteTodoUsecase deleteTodoUsecase;
  Stream<List<Todo>> get todoStream => getTodoStreamUsecase.call(NoParams());

  TodoBloc({
    required this.getTodoStreamUsecase,
    required this.addTodoUsecase,
    required this.updateTodoUsecase,
    required this.deleteTodoUsecase,
  }) : super(const _Initial()) {
    on<_AddTodoItem>((event, emit) {
      emit(const _Loading());
      Todo todo = event.todo.copyWith(
        title: event.todo.title.trim(),
        description: event.todo.description.trim(),
      );
      addTodoUsecase(todo);
      newTodo = sl<Todo>();
      emit(const _Initial());
    });
    on<_UpdateTodoItem>((event, emit) {
      emit(const _Loading());
      Todo todo = event.todo.copyWith(
        title: event.todo.title.trim(),
        description: event.todo.description.trim(),
      );
      int? requestRateCount = sl<SharedPreferences>().getInt(requestRateKey);
      if (requestRateCount == null) {
        requestRateCount = 1;
        sl<SharedPreferences>().setInt(requestRateKey, requestRateCount);
      } else if (requestRateCount == 3) {
        requestReview();
        requestRateCount++;
        sl<SharedPreferences>().setInt(requestRateKey, requestRateCount);
      } else if (requestRateCount < 3) {
        requestRateCount++;
        sl<SharedPreferences>().setInt(requestRateKey, requestRateCount);
      }
      updateTodoUsecase(todo);
      emit(const _Initial());
    });
    on<_DeleteTodoItem>((event, emit) {
      emit(const _Loading());
      deleteTodoUsecase(event.id);
      emit(const _Initial());
    });
  }
}
