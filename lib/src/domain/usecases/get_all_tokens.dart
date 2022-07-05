import 'package:dartz/dartz.dart';
import 'package:tokens/src/domain/entities/token/listings.dart';
import 'package:tokens/src/domain/repositories/token_repository.dart';

import '../../core/network/network_exception.dart';

class GetAllTokens {
  final TokenRepository _repository;
  GetAllTokens(this._repository);

  Future<Either<NetworkExceptions, Listings>> execute(int page, int pageSize) {
    return _repository.getAllTokens(page, pageSize);
  }
}
