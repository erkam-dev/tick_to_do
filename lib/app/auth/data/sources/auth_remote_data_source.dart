import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Stream<User?> getAuthStatusStream();
  Future<UserCredential?> signInWithGoogle();
  Future<void> signOut();
  Future<void> deleteAccount();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  @override
  Stream<User?> getAuthStatusStream() {
    return firebaseAuth.authStateChanges();
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      throw Exception('Failed to sign in with Google: $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await googleSignIn.disconnect();
      await firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }

  @override
  Future<void> deleteAccount() async {
    final currentUser = firebaseAuth.currentUser;
    try {
      await currentUser!.delete();
    } catch (e) {
      throw Exception('Failed to delete account: $e');
    }
    try {
      await googleSignIn.disconnect();
    } catch (e) {
      throw Exception('Failed to disconnect google signin: $e');
    }
  }
}
