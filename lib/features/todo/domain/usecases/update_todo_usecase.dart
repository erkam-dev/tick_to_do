import 'package:dartz/dartz.dart';
import 'package:tick_to_do/features/todo/domain/entities/todo.dart';
import 'package:tick_to_do/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/core.dart';

class UpdateTodoUsecase implements Usecase<void, Todo> {
  final TodoRepository repository;

  UpdateTodoUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(Todo todo) async =>
      await repository.updateTodo(todo);
}
