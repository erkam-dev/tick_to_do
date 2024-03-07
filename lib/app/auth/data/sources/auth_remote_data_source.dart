import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future getSignedInUser();
  Future signInWithGoogle();
  Future signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl(this.firebaseAuth);

  @override
  Future<User?> getSignedInUser() async {
    return firebaseAuth.currentUser;
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
