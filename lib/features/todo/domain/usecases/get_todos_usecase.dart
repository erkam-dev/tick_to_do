import 'package:tick_to_do/features/todo/domain/entities/todo.dart';
import 'package:tick_to_do/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/core.dart';

class GetTodosUsecase implements UsecaseNoFuture<Stream<List<Todo>>, NoParams> {
  final TodoRepository repository;

  GetTodosUsecase(this.repository);

  @override
  Stream<List<Todo>> call(NoParams noParams) => repository.getTodos();
}
