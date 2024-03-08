import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../lib.dart';

initTodoFeatures() {
  sl.registerFactory<TodoBloc>(() => TodoBloc(
        getTodoStreamUsecase: sl<GetTodoStreamUsecase>(),
        addTodoUsecase: sl<AddTodoUsecase>(),
        updateTodoUsecase: sl<UpdateTodoUsecase>(),
        deleteTodoUsecase: sl<DeleteTodoUsecase>(),
      ));
  sl.registerLazySingleton<Todo>(() => const Todo(
      id: '', title: '', description: '', isDone: false, createdTime: null));
  sl.registerLazySingleton<TodoModel>(() => const TodoModel(
      id: '', title: '', description: '', isDone: false, createdTime: null));
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
  sl.registerLazySingleton<TodoRemoteDataSource>(() => TodoRemoteDataSourceImpl(
        firestore: sl<FirebaseFirestore>(),
        uid: sl<FirebaseAuth>().currentUser!.uid,
      ));
}
