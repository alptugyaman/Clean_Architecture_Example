import 'package:dartz/dartz.dart';
import 'package:tokens/src/domain/entities/token_details/token_detail.dart';
import 'package:tokens/src/domain/repositories/token_repository.dart';

import '../../core/network/network_exception.dart';

class GetTokenDetails {
  final TokenRepository _repository;
  GetTokenDetails(this._repository);

  Future<Either<NetworkExceptions, TokenDetail>> getTokenDetail(String symbol) {
    return _repository.getTokenDetails(symbol);
  }
}
