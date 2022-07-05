import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokens/src/core/functions/calculations.dart';
import 'package:tokens/src/domain/entities/alert_tokens.dart';
import 'package:tokens/src/domain/entities/token/token.dart';

class AlertTitle extends StatelessWidget {
  const AlertTitle({
    Key? key,
    required this.alerts,
    required double percent,
    required this.tokens,
  })  : _percent = percent,
        super(key: key);

  final AlertTokens alerts;
  final double _percent;
  final List<Token> tokens;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: .66.sw),
      child: RichText(
        text: TextSpan(
          text: 'You favorited ',
          style: defaultStyle,
          children: <TextSpan>[
            TextSpan(
              text: alerts.name.toUpperCase(),
              style: warnStyle,
            ),
            TextSpan(
              text: ' when it was worth ',
              style: defaultStyle,
            ),
            TextSpan(
              text: '\$${alerts.price}',
              style: percentageStyle,
            ),
            const TextSpan(text: ' in '),
            TextSpan(
              text: alerts.favDate,
              style: warnStyle,
            ),
            const TextSpan(text: '. The change since then is '),
            TextSpan(
              text: '${_percent.toStringAsFixed(3)}%.',
              style: percentageStyle,
            ),
            TextSpan(
              text:
                  '\n\n${alerts.name.toUpperCase()} is \$${getPrice(tokens, alerts)} now.',
              style: finalStyle,
            ),
          ],
        ),
      ),
    );
  }

  TextStyle get defaultStyle => TextStyle(fontSize: 12.sp);
  TextStyle get warnStyle => TextStyle(
        color: Colors.amber,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      );
  TextStyle get percentageStyle => TextStyle(
        color: getPercent(alerts, tokens) > 0 ? Colors.green : Colors.red,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      );
  TextStyle get finalStyle => TextStyle(
        color: Colors.indigo[300],
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      );
}
