import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../lib.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCredential?>> signInWithGoogle();

  Stream<User?> getAuthStatusStream();

  Future<void> signOut();

  Future<void> deleteAccount();
}
