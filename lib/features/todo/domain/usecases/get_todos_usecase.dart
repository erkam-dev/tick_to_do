import 'package:dartz/dartz.dart';
import 'package:tick_to_do/features/todo/domain/entities/todo.dart';
import 'package:tick_to_do/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/core.dart';

class GetTodosUseCase {
  final TodoRepository repository;

  GetTodosUseCase(this.repository);

  Future<Either<Failure, List<Todo>>> execute() async {
    return await repository.getTodos();
  }
}
