

import '../../../../core/either/either.dart';
import '../../../../core/exception/exception.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entity/authenticated_user.dart';
import '../../domain/repository/authentication.dart';
import '../data_source/remote.dart';
import '../models/authenticated_user.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource _dataSource;

  const AuthenticationRepositoryImpl(
      {required AuthenticationRemoteDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> getUser() async {
    try {
      final user = await _dataSource.getUser();
      return Right(AuthenticatedUserModel.fromFirebaseUser(user));
    } on ServerExcaption catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> login(
      String email, String password) async {
    try {
      final user = await _dataSource.getUser();
      return Right(AuthenticatedUserModel.fromFirebaseUser(user));
    } on ServerExcaption catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final response = await _dataSource.logout();
      return Right(response);
    } on ServerExcaption catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> sing_up(
      String email, String password) async {
    try {
      final response = await _dataSource.sing_up(email, password);
      return Right(AuthenticatedUserModel.fromFirebaseUser(response));
    } on ServerExcaption catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }
}
