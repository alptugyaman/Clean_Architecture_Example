part of 'alerts_bloc.dart';

abstract class AlertsEvent extends Equatable {
  const AlertsEvent();

  @override
  List<Object> get props => [];
}

class GetAlertTokens extends AlertsEvent {
  const GetAlertTokens();
}

class RemoveAlertTokens extends AlertsEvent {
  const RemoveAlertTokens(this.alertTokens);
  final AlertTokens alertTokens;

  @override
  List<Object> get props => [];
}

class InsertAlertTokens extends AlertsEvent {
  const InsertAlertTokens(this.alertTokens);
  final AlertTokens alertTokens;

  @override
  List<Object> get props => [];
}
