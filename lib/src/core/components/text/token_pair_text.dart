import 'package:flutter/material.dart';

class TokenPairText extends StatelessWidget {
  const TokenPairText({Key? key, required this.symbol}) : super(key: key);

  final String symbol;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: symbol,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '/USDT',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
