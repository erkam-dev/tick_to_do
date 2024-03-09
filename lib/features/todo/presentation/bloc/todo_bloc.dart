import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tick_to_do/core/core.dart';
import 'package:tick_to_do/features/features.dart';

part 'todo_bloc.freezed.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodoStreamUsecase getTodoStreamUsecase;
  final AddTodoUsecase addTodoUsecase;
  final UpdateTodoUsecase updateTodoUsecase;
  final DeleteTodoUsecase deleteTodoUsecase;
  Stream<List<Todo>> get alltodoStream => getTodoStreamUsecase.call(NoParams());
  Stream<List<Todo>> get todoStream => alltodoStream
      .map((event) => event.where((element) => !element.isDone).toList());
  Stream<List<Todo>> get completedStream => alltodoStream
      .map((event) => event.where((element) => element.isDone).toList());

  TodoBloc({
    required this.getTodoStreamUsecase,
    required this.addTodoUsecase,
    required this.updateTodoUsecase,
    required this.deleteTodoUsecase,
  }) : super(const _Initial()) {
    on<_AddTodoItem>((event, emit) {
      emit(const _Loading());
      addTodoUsecase(event.todo);
      emit(const _Initial());
    });
    on<_UpdateTodoItem>((event, emit) {
      emit(const _Loading());
      updateTodoUsecase(event.todo);
      emit(const _Initial());
    });
    on<_DeleteTodoItem>((event, emit) {
      emit(const _Loading());
      deleteTodoUsecase(event.id);
      emit(const _Initial());
    });
  }
}
