import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tick_to_do/core/core.dart';

import '../../../app.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Profile? profile;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  final GetAuthStatusStreamUsecase getAuthStatusStreamUsecase;
  final SignOutUseCase signOutUseCase;
  final DeleteAccountUseCase deleteAccountUseCase;

  StreamSubscription<User?>? authStatusSubscription;
  Stream<User?> get authStatusStream => getAuthStatusStreamUsecase(NoParams());

  AuthBloc({
    required this.signInWithGoogleUseCase,
    required this.getAuthStatusStreamUsecase,
    required this.signOutUseCase,
    required this.deleteAccountUseCase,
  }) : super(const _Initial()) {
    on<_GetAuthStatusStream>((event, emit) {
      emit(const _Loading());
      authStatusSubscription = authStatusStream.listen((user) {
        if (user != null) {
          profile = Profile.fromModel(ProfileModel.fromFirebase(user));
        } else {
          profile = null;
        }
      }, onError: (e) {
        authStatusSubscription?.cancel();
        if (emit.isDone) {
          emit(const _Error());
        }
      });
      emit(const _Initial());
    });
    on<_SignInWithGoogle>((event, emit) async {
      emit(const _Loading());
      final result = await signInWithGoogleUseCase(NoParams());
      result.fold(
        (failure) => emit(const _Error()),
        (success) => emit(const _Initial()),
      );
    });
    on<_SignOut>((event, emit) async {
      emit(const _Loading());
      await signOutUseCase(NoParams());
      emit(const _SignedOut());
      emit(const _Initial());
    });
    on<_DeleteAccount>((event, emit) async {
      emit(const _Loading());
      await deleteAccountUseCase(NoParams());
      emit(const _SignedOut());
      emit(const _Initial());
    });
  }
}
