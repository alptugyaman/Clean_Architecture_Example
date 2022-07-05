import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokens/src/domain/entities/alert_tokens.dart';
import 'package:tokens/src/domain/entities/token/token.dart';
import 'package:tokens/src/presentation/widgets/alert/alert_leading.dart';
import 'package:tokens/src/presentation/widgets/alert/alert_title.dart';
import 'package:tokens/src/presentation/widgets/alert/alert_trailing.dart';

class Alerts extends StatelessWidget {
  const Alerts({
    Key? key,
    required double percent,
    required this.alerts,
    required this.tokens,
  })  : _percent = percent,
        super(key: key);

  final double _percent;
  final AlertTokens alerts;
  final List<Token> tokens;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.025.sw,
            vertical: 0.025.sw,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AlertLeading(percent: _percent),
              AlertTitle(
                alerts: alerts,
                percent: _percent,
                tokens: tokens,
              ),
              AlertTrailing(alerts: alerts),
            ],
          ),
        ),
      ),
    );
  }
}
