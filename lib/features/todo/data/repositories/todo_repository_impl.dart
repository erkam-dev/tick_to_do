import 'package:dartz/dartz.dart';
import 'package:tick_to_do/features/todo/data/models/todo_model.dart';
import 'package:tick_to_do/features/todo/data/sources/todo_remote_data_source.dart';
import 'package:tick_to_do/features/todo/domain/entities/todo.dart';
import 'package:tick_to_do/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/core.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;

  TodoRepositoryImpl(this.remoteDataSource);

  @override
  Stream<List<Todo>> getTodoStream() {
    return remoteDataSource.getTodoStream().map((List<TodoModel> todoModels) =>
        todoModels.map((TodoModel model) => Todo.fromModel(model)).toList());
  }

  @override
  Future<Either<Failure, void>> addTodo(Todo todo) async {
    try {
      final todoModel = TodoModel.fromEntity(todo);
      await remoteDataSource.addTodo(todoModel);
      return const Right(null);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateTodo(Todo todo) async {
    try {
      final todoModel = TodoModel.fromEntity(todo);
      await remoteDataSource.updateTodo(todoModel);
      return const Right(null);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTodo(String id) async {
    try {
      await remoteDataSource.deleteTodo(id);
      return const Right(null);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
