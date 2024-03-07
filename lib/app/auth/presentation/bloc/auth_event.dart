part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signInWithGoogle() = _SignInWithGoogle;
  const factory AuthEvent.getSignedInUser() = _GetSignedInUser;
  const factory AuthEvent.signOut() = _SignOut;
}
