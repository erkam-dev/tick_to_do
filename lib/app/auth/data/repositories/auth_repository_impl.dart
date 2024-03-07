import 'package:dartz/dartz.dart';
import 'package:tick_to_do/core/types/failure.dart';

import '../../../app.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  ProfileModel getSignedInUser() {
    return remoteDataSource.getSignedInUser();
  }

  @override
  Future<Either<Failure, Unit>> signInWithGoogle() async {
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
}
