import 'package:flutter/material.dart';
import 'package:tokens/src/core/functions/calculations.dart';
import 'package:tokens/src/domain/entities/alert_tokens.dart';
import 'package:tokens/src/domain/entities/token/token.dart';
import 'package:tokens/src/presentation/widgets/alert/alerts.dart';

class AlertsListView extends StatelessWidget {
  const AlertsListView({
    Key? key,
    required this.alertTokens,
    required this.tokens,
  }) : super(key: key);

  final List<AlertTokens> alertTokens;
  final List<Token> tokens;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: alertTokens.length,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemBuilder: (context, index) {
        final alerts = alertTokens[index];
        double _percent = getPercent(alerts, tokens);
        return Alerts(
          percent: _percent,
          alerts: alerts,
          tokens: tokens,
        );
      },
    );
  }
}
