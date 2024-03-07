import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tick_to_do/core/core.dart';

import '../../../app.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Profile? profile;
  StreamSubscription? authStatusSubscription;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  final GetSignedInUserUseCase getSignedInUserUseCase;
  final GetAuthStatusStreamUsecase getAuthStatusStreamUsecase;
  final SignOutUseCase signOutUseCase;

  AuthBloc({
    required this.signInWithGoogleUseCase,
    required this.getSignedInUserUseCase,
    required this.getAuthStatusStreamUsecase,
    required this.signOutUseCase,
  }) : super(const _Initial()) {
    on<_GetAuthStatusStream>((event, emit) {
      emit(const _Loading());
      authStatusSubscription =
          getAuthStatusStreamUsecase(NoParams()).listen((user) {
        if (user != null) {
          profile = Profile.fromModel(ProfileModel.fromFirebase(user));
          emit(const _Initial());
        } else {
          profile = null;
          emit(const _Initial());
        }
      }, onError: (e) {
        authStatusSubscription?.cancel();
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
    on<_GetSignedInUser>((event, emit) {
      emit(const _Loading());
      var profileModel = getSignedInUserUseCase(NoParams());
      if (profileModel != null) {
        profile = Profile.fromModel(profileModel);
      } else {
        profile = null;
      }
      emit(const _Initial());
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
