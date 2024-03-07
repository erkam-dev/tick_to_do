import 'package:dartz/dartz.dart';
import 'package:tick_to_do/app/auth/data/sources/auth_remote_data_source.dart';
import 'package:tick_to_do/core/types/failure.dart';

import '../../../app.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Option<ProfileModel>> getSignedInUser() async {
    try {
      return await remoteDataSource.getSignedInUser();
    } on ServerException {
      return const None();
    }
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
