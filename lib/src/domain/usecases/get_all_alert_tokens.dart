import 'package:tokens/src/domain/entities/alert_tokens.dart';
import 'package:tokens/src/domain/repositories/token_repository.dart';

class GetAllAlertTokens {
  final TokenRepository _repository;
  GetAllAlertTokens(this._repository);

  Future<List<AlertTokens>> getAllAlertTokens() {
    return _repository.getAllAlertTokens();
  }
}
