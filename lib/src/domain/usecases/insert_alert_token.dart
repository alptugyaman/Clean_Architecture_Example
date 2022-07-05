import 'package:tokens/src/domain/entities/alert_tokens.dart';
import 'package:tokens/src/domain/repositories/token_repository.dart';

class InsertAlertToken {
  final TokenRepository _repository;
  InsertAlertToken(this._repository);

  Future<void> insertANewAlert(AlertTokens alertToken) {
    return _repository.insertANewAlert(alertToken);
  }
}
