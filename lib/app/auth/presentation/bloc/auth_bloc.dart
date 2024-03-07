import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tick_to_do/core/core.dart';

import '../../../app.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Profile? profile;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  final GetSignedInUserUseCase getSignedInUserUseCase;
  final SignOutUseCase signOutUseCase;

  AuthBloc({
    required this.signInWithGoogleUseCase,
    required this.getSignedInUserUseCase,
    required this.signOutUseCase,
  }) : super(const _Initial()) {
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
      profile = Profile.fromModel(getSignedInUserUseCase(NoParams()));
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
