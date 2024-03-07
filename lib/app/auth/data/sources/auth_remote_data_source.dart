import 'package:firebase_auth/firebase_auth.dart';
import 'package:tick_to_do/app/app.dart';

abstract class AuthRemoteDataSource {
  ProfileModel? getSignedInUser();
  Stream<User?> getAuthStatusStream();
  Future signInWithGoogle();
  Future signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl(this.firebaseAuth);

  @override
  ProfileModel? getSignedInUser() {
    if (firebaseAuth.currentUser != null) {
      return ProfileModel.fromFirebase(firebaseAuth.currentUser!);
    }
    return null;
  }

  @override
  Stream<User?> getAuthStatusStream() {
    return firebaseAuth.authStateChanges();
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleAuthProvider googleProvider = GoogleAuthProvider();
      final UserCredential userCredential =
          await firebaseAuth.signInWithPopup(googleProvider);
      return userCredential;
    } catch (e) {
      throw Exception('Failed to sign in with Google: $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }
}
