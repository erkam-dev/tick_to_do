import 'package:dartz/dartz.dart';
import 'package:tick_to_do/features/todo/domain/entities/todo.dart';
import 'package:tick_to_do/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/core.dart';

class AddTodoUsecase implements Usecase<void, Todo> {
  final TodoRepository repository;

  AddTodoUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(Todo todo) async =>
      await repository.addTodo(todo);
}
