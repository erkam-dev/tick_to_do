part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signInWithGoogle() = _SignInWithGoogle;
  const factory AuthEvent.getAuthStatusStream() = _GetAuthStatusStream;
  const factory AuthEvent.signOut() = _SignOut;
  const factory AuthEvent.deleteAccount() = _DeleteAccount;
}
