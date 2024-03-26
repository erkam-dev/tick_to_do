import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tick_to_do/core/types/failure.dart';

import '../../../app.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Stream<User?> getAuthStatusStream() {
    return remoteDataSource.getAuthStatusStream();
  }

  @override
  Future<Either<Failure, UserCredential?>> signInWithGoogle() async {
    try {
      return Right(await remoteDataSource.signInWithGoogle());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await remoteDataSource.signOut();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> deleteAccount() async {
    try {
      await remoteDataSource.deleteAccount();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
