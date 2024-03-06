import 'package:dartz/dartz.dart';
import 'package:tick_to_do/features/todo/domain/entities/todo.dart';
import 'package:tick_to_do/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/core.dart';

class GetTodosUsecase
    implements Usecase<Either<Failure, List<Todo>>, NoParams> {
  final TodoRepository repository;

  GetTodosUsecase(this.repository);

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams noParams) async =>
      await repository.getTodos();
}
