import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tick_to_do/core/core.dart';
import 'package:tick_to_do/features/features.dart';

part 'todo_bloc.freezed.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  StreamSubscription? todoSubscription;
  final GetTodoStreamUsecase getTodosUsecase;
  final AddTodoUsecase addTodoUsecase;
  final UpdateTodoUsecase updateTodoUsecase;
  final DeleteTodoUsecase deleteTodoUsecase;
  TodoBloc({
    required this.getTodosUsecase,
    required this.addTodoUsecase,
    required this.updateTodoUsecase,
    required this.deleteTodoUsecase,
  }) : super(const _Initial()) {
    on<_GetTodoStream>((event, emit) async {
      emit(const _Loading());
      todoSubscription = getTodosUsecase.call(NoParams()).listen(
        (todos) {
          emit(_Initial(todos));
        },
        onError: (e) {
          todoSubscription?.cancel();
          emit(const _Error());
        },
      );
    });
    on<_AddTodoItem>((event, emit) {
      emit(const _Loading());
      addTodoUsecase(event.todo).then((_) {
        emit(const _Initial());
      }).catchError((e) {
        emit(const _Error());
      });
    });
    on<_UpdateTodoItem>((event, emit) {
      emit(const _Loading());
      updateTodoUsecase(event.todo).then((value) {
        emit(const _Initial());
      }).catchError((e) {
        emit(const _Error());
      });
    });
    on<_DeleteTodoItem>((event, emit) {
      emit(const _Loading());
      deleteTodoUsecase(event.id).then((value) {
        emit(const _Initial());
      }).catchError((e) {
        emit(const _Error());
      });
    });
  }
}
