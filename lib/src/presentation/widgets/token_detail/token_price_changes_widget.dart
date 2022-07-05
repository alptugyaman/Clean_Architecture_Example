import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokens/src/core/components/container/percent24.dart';
import 'package:tokens/src/domain/entities/token/token.dart';

class TokenPriceChanges extends StatelessWidget {
  const TokenPriceChanges({
    Key? key,
    required this.token,
  }) : super(key: key);

  final Token token;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Changes(
            period: '7d chg',
            value: token.quote!.usd!.percentChange7d!,
          ),
          Changes(
            period: '30d chg',
            value: token.quote!.usd!.percentChange30d!,
          ),
          Changes(
            period: '60d chg',
            value: token.quote!.usd!.percentChange60d!,
          ),
          Changes(
            period: '90d chg',
            value: token.quote!.usd!.percentChange90d!,
          ),
        ],
      ),
    );
  }
}

class Changes extends StatelessWidget {
  const Changes({
    Key? key,
    required this.value,
    required this.period,
  }) : super(key: key);

  final double value;
  final String period;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          period,
          style: TextStyle(
            color: Colors.white60,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Percent24H(value: value),
      ],
    );
  }
}
