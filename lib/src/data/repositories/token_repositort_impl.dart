import 'package:dio/dio.dart';
import 'package:tokens/src/core/network/network_exception.dart';
import 'package:tokens/src/data/datasources/local/app_database.dart';
import 'package:tokens/src/data/datasources/remote/remote_data_source.dart';
import 'package:tokens/src/domain/entities/alert_tokens.dart';

import 'package:tokens/src/domain/entities/token/listings.dart';

import 'package:dartz/dartz.dart';
import 'package:tokens/src/domain/entities/token_details/token_detail.dart';
import 'package:tokens/src/domain/repositories/token_repository.dart';

class TokenRepositoryImpl implements TokenRepository {
  final RemoteDataSource remoteDataSource;
  final AppDatabase appDatabase;

  TokenRepositoryImpl({
    required this.remoteDataSource,
    required this.appDatabase,
  });

  //* API
  @override
  Future<Either<NetworkExceptions, Listings>> getAllTokens(
    int page,
    int pageSize,
  ) async {
    try {
      final result = await remoteDataSource.getAllTokens(page, pageSize);
      return Right(result.toEntity());
    } on DioError catch (e) {
      return Left(NetworkExceptions.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, TokenDetail>> getTokenDetails(
    String symbol,
  ) async {
    try {
      final result = await remoteDataSource.getTokenDetails(symbol);
      return Right(result.toEntity());
    } on DioError catch (e) {
      return Left(NetworkExceptions.fromDioError(e));
    }
  }

  //* DB
  @override
  Future<void> insertANewAlert(AlertTokens alertToken) async {
    await appDatabase.alertDao.insertANewAlert(alertToken);
  }

  @override
  Future<List<AlertTokens>> getAllAlertTokens() async {
    return await appDatabase.alertDao.getAllAlertTokens();
  }

  @override
  Future<void> deleteAlert(AlertTokens alertToken) async {
    await appDatabase.alertDao.deleteAnAlert(alertToken);
  }
}
