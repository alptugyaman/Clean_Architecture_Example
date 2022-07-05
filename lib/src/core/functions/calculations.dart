import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tokens/src/domain/entities/alert_tokens.dart';
import 'package:tokens/src/domain/entities/token/token.dart';

double getPercent(AlertTokens alerts, List<Token> tokens) {
  double _percent = 1 -
      (double.parse(alerts.price) /
          tokens.where((e) => e.name == alerts.name).first.quote!.usd!.price!);
  return _percent;
}

String getPrice(List<Token> tokens, AlertTokens alerts) => tokens
    .where((e) => e.name == alerts.name)
    .first
    .quote!
    .usd!
    .price!
    .toStringAsFixed(2);

Color? getColorDesicion(AlertTokens alerts, List<Token> tokens) {
  final _percent = getPercent(alerts, tokens);
  if (_percent > 0) {
    if (_percent < 0.1) {
      return Colors.green[300];
    } else if (_percent >= 0.1 && _percent < 0.35) {
      return Colors.green[400];
    } else if (_percent >= 0.35 && _percent < 0.75) {
      return Colors.green[500];
    } else {
      return Colors.green[700];
    }
  }
  if (_percent < 0) {
    if (_percent > -0.1) {
      return Colors.red[300];
    } else if (_percent <= -0.1 && _percent > -0.35) {
      return Colors.red[400];
    } else if (_percent <= 0.35 && _percent > -0.75) {
      return Colors.red[500];
    } else {
      return Colors.green[700];
    }
  }
  return Colors.grey;
}

String dateToString() {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  String dateString = dateFormat.format(DateTime.now());
  return dateString;
}
