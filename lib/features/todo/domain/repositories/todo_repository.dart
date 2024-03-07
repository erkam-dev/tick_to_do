import 'package:dartz/dartz.dart';
import 'package:tick_to_do/features/todo/domain/entities/todo.dart';

import '../../../../core/core.dart';

abstract class TodoRepository {
  Stream<List<Todo>> getTodoStream();
  Future<Either<Failure, void>> addTodo(Todo todo);
  Future<Either<Failure, void>> updateTodo(Todo todo);
  Future<Either<Failure, void>> deleteTodo(String id);
}
