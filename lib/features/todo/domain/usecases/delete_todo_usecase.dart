import 'package:dartz/dartz.dart';
import 'package:tick_to_do/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/core.dart';

class DeleteTodoUsecase implements Usecase<void, String> {
  final TodoRepository repository;

  DeleteTodoUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(String id) async =>
      await repository.deleteTodo(id);
}
