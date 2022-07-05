import 'package:dartz/dartz.dart';
import 'package:tokens/src/core/network/network_exception.dart';
import 'package:tokens/src/domain/entities/alert_tokens.dart';
import 'package:tokens/src/domain/entities/token/listings.dart';
import 'package:tokens/src/domain/entities/token_details/token_detail.dart';

abstract class TokenRepository {
  //* API METHODS
  Future<Either<NetworkExceptions, Listings>> getAllTokens(
    int page,
    int pageSize,
  );

  Future<Either<NetworkExceptions, TokenDetail>> getTokenDetails(String symbol);

  //* DB METHODS
  Future<List<AlertTokens>> getAllAlertTokens();

  Future<void> insertANewAlert(AlertTokens alertTokens);

  Future<void> deleteAlert(AlertTokens alertToken);
}
