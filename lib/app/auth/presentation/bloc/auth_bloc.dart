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

  StreamSubscription<User?>? authStatusSubscription;
  Stream<User?> get authStatusStream => getAuthStatusStreamUsecase(NoParams());

  AuthBloc({
    required this.signInWithGoogleUseCase,
    required this.getAuthStatusStreamUsecase,
    required this.signOutUseCase,
  }) : super(const _Initial()) {
    on<_GetAuthStatusStream>((event, emit) {
      emit(const _Loading());
      authStatusSubscription = authStatusStream.listen((user) {
        if (user != null) {
          profile = Profile.fromModel(ProfileModel.fromFirebase(user));
          emit(const _Initial());
        } else {
          profile = null;
          emit(const _Initial());
        }
      }, onError: (e) {
        authStatusSubscription?.cancel();
        emit(const _Error());
      });
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
      try {
        await signOutUseCase(NoParams());
        emit(const _Initial());
      } catch (e) {
        emit(const _Error());
      }
    });
  }
}
