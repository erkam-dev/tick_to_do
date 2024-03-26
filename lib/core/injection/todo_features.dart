import 'package:cloud_firestore/cloud_firestore.dart';

import '../../lib.dart';

initTodoFeatures() {
  sl.registerFactory<TodoBloc>(() => TodoBloc(
        getTodoStreamUsecase: sl<GetTodoStreamUsecase>(),
        addTodoUsecase: sl<AddTodoUsecase>(),
        updateTodoUsecase: sl<UpdateTodoUsecase>(),
        deleteTodoUsecase: sl<DeleteTodoUsecase>(),
      ));
  sl.registerLazySingleton<Todo>(() => Todo(
        id: DateTime.now().toString(),
        title: '',
        description: '',
        isDone: false,
        createdTime: DateTime.now(),
      ));
  sl.registerLazySingleton<TodoModel>(() => TodoModel(
        id: DateTime.now().toString(),
        title: '',
        description: '',
        isDone: false,
        createdTime: DateTime.now(),
      ));
  sl.registerLazySingleton<GetTodoStreamUsecase>(
      () => GetTodoStreamUsecase(sl<TodoRepositoryImpl>()));
  sl.registerLazySingleton<AddTodoUsecase>(
      () => AddTodoUsecase(sl<TodoRepositoryImpl>()));
  sl.registerLazySingleton<UpdateTodoUsecase>(
      () => UpdateTodoUsecase(sl<TodoRepositoryImpl>()));
  sl.registerLazySingleton<DeleteTodoUsecase>(
      () => DeleteTodoUsecase(sl<TodoRepositoryImpl>()));
  sl.registerLazySingleton<TodoRepository>(() => sl<TodoRepositoryImpl>());
  sl.registerLazySingleton<TodoRepositoryImpl>(
      () => TodoRepositoryImpl(sl<TodoRemoteDataSource>()));
  sl.registerLazySingleton<TodoRemoteDataSource>(
      () => TodoRemoteDataSourceImpl(firestore: sl<FirebaseFirestore>()));
}
