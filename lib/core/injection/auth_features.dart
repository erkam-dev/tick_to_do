import 'package:firebase_auth/firebase_auth.dart';

import '../../lib.dart';

initAuthFeatures() {
  sl.registerFactory<AuthBloc>(() => AuthBloc(
        signInWithGoogleUseCase: sl<SignInWithGoogleUseCase>(),
        getSignedInUserUseCase: sl<GetSignedInUserUseCase>(),
        signOutUseCase: sl<SignOutUseCase>(),
      ));
  sl.registerLazySingleton<Profile>(() => const Profile());
  sl.registerLazySingleton<ProfileModel>(() => const ProfileModel());

  sl.registerLazySingleton<SignInWithGoogleUseCase>(
      () => SignInWithGoogleUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton<GetSignedInUserUseCase>(
      () => GetSignedInUserUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(sl<AuthRepository>()));

  sl.registerLazySingleton<AuthRepository>(() => sl<AuthRepositoryImpl>());
  sl.registerLazySingleton<AuthRepositoryImpl>(
      () => AuthRepositoryImpl(sl<AuthRemoteDataSource>()));
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl<FirebaseAuth>()));
}
