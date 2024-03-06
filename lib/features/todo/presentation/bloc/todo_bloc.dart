import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tick_to_do/features/features.dart';

import '../../../../core/core.dart';

part 'todo_bloc.freezed.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<Todo> todoList = [];
  final GetTodosUsecase getTodosUsecase;
  final AddTodoUsecase addTodoUsecase;
  final UpdateTodoUsecase updateTodoUsecase;
  final DeleteTodoUsecase deleteTodoUsecase;
  TodoBloc({
    required this.getTodosUsecase,
    required this.addTodoUsecase,
    required this.updateTodoUsecase,
    required this.deleteTodoUsecase,
  }) : super(const _Initial()) {
    on<_GetTodoItems>((event, emit) {
      emit(const _Loading());
      getTodosUsecase(NoParams()).then((value) {
        value.fold(
          (l) => emit(const _Error()),
          (r) {
            todoList = r;
            emit(const _Initial());
          },
        );
      });
    });
    on<_AddTodoItem>((event, emit) {
      emit(const _Loading());
      addTodoUsecase(event.todo).then((value) {
        value.fold(
          (l) => emit(const _Error()),
          (r) {
            todoList.add(event.todo);
            emit(const _Initial());
          },
        );
      });
    });
    on<_UpdateTodoItem>((event, emit) {
      emit(const _Loading());
      updateTodoUsecase(event.todo).then((value) {
        value.fold(
          (l) => emit(const _Error()),
          (r) {
            todoList = todoList.map((e) {
              if (e.id == event.todo.id) {
                return event.todo;
              }
              return e;
            }).toList();
            emit(const _Initial());
          },
        );
      });
    });
    on<_DeleteTodoItem>((event, emit) {
      emit(const _Loading());
      deleteTodoUsecase(event.id).then((value) {
        value.fold(
          (l) => emit(const _Error()),
          (r) {
            todoList.removeWhere((element) => element.id == event.id);
            emit(const _Initial());
          },
        );
      });
    });
  }
}
