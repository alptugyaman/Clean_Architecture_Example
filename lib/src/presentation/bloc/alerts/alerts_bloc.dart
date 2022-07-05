import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tokens/src/domain/entities/alert_tokens.dart';
import 'package:tokens/src/domain/usecases/delete_alert_token.dart';
import 'package:tokens/src/domain/usecases/insert_alert_token.dart';
import 'package:tokens/src/domain/usecases/get_all_alert_tokens.dart';

part 'alerts_event.dart';
part 'alerts_state.dart';

class AlertsBloc extends Bloc<AlertsEvent, AlertsState> {
  final InsertAlertToken _insertAlertTokens;
  final GetAllAlertTokens _getAllAlertTokens;
  final DeleteAlertToken _deleteAlertToken;

  AlertsBloc(
    this._insertAlertTokens,
    this._getAllAlertTokens,
    this._deleteAlertToken,
  ) : super(AlertsInitial()) {
    on<InsertAlertTokens>((event, emit) async {
      try {
        await _insertAlertTokens.insertANewAlert(event.alertTokens);
      } on Exception catch (e) {
        emit(AlertError(e.toString()));
      }
    });

    on<GetAlertTokens>((event, emit) async {
      emit(AlertsLoading());
      try {
        final result = await _getAllAlertTokens.getAllAlertTokens();
        if (result.isNotEmpty) {
          emit(AlertHasData(result));
        } else {
          emit(AlertsEmpty());
        }
      } on Exception catch (e) {
        emit(AlertError(e.toString()));
      }
    });

    on<RemoveAlertTokens>((event, emit) async {
      try {
        await _deleteAlertToken.deleteAlert(event.alertTokens);
      } on Exception catch (e) {
        emit(AlertError(e.toString()));
      }
    });
  }
}
