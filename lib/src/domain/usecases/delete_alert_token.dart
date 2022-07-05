import 'package:tokens/src/domain/entities/alert_tokens.dart';
import 'package:tokens/src/domain/repositories/token_repository.dart';

class DeleteAlertToken {
  final TokenRepository _repository;
  DeleteAlertToken(this._repository);

  Future<void> deleteAlert(AlertTokens alertToken) {
    return _repository.deleteAlert(alertToken);
  }
}
