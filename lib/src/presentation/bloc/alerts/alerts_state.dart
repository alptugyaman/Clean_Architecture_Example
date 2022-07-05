part of 'alerts_bloc.dart';

abstract class AlertsState extends Equatable {
  const AlertsState();

  @override
  List<Object> get props => [];
}

class AlertsInitial extends AlertsState {}

class AlertsLoading extends AlertsState {}

class AlertsEmpty extends AlertsState {}

class AlertError extends AlertsState {
  final String message;
  const AlertError(this.message);

  @override
  List<Object> get props => [message];
}

class AlertHasData extends AlertsState {
  final List<AlertTokens> alertTokens;
  const AlertHasData(this.alertTokens);

  @override
  List<Object> get props => [alertTokens];
}
