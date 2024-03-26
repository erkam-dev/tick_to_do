import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../lib.dart';

initAuthFeatures() {
  sl.registerFactory<AuthBloc>(() => AuthBloc(
        signInWithGoogleUseCase: sl<SignInWithGoogleUseCase>(),
        signOutUseCase: sl<SignOutUseCase>(),
        getAuthStatusStreamUsecase: sl<GetAuthStatusStreamUsecase>(),
        deleteAccountUseCase: sl<DeleteAccountUseCase>(),
      ));
  sl.registerLazySingleton<Profile>(() => const Profile());
  sl.registerLazySingleton<ProfileModel>(() => const ProfileModel());

  sl.registerLazySingleton<SignInWithGoogleUseCase>(
      () => SignInWithGoogleUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton<GetAuthStatusStreamUsecase>(
      () => GetAuthStatusStreamUsecase(sl<AuthRepository>()));
  sl.registerLazySingleton<DeleteAccountUseCase>(
      () => DeleteAccountUseCase(sl<AuthRepository>()));

  sl.registerLazySingleton<AuthRepository>(() => sl<AuthRepositoryImpl>());
  sl.registerLazySingleton<AuthRepositoryImpl>(
      () => AuthRepositoryImpl(sl<AuthRemoteDataSource>()));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
      firebaseAuth: sl<FirebaseAuth>(), googleSignIn: sl<GoogleSignIn>()));
}
