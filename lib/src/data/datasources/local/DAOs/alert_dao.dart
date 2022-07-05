import 'package:floor/floor.dart';
import 'package:tokens/src/core/contants/db_constants.dart';
import 'package:tokens/src/domain/entities/alert_tokens.dart';

@dao
abstract class AlertDao {
  @Query('SELECT * FROM ${DBConstants.alertTokenTable} ORDER BY id DESC')
  Future<List<AlertTokens>> getAllAlertTokens();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertANewAlert(AlertTokens alertToken);

  @delete
  Future<void> deleteAnAlert(AlertTokens alertToken);
}
