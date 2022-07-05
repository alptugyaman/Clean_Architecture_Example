import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyText extends Text {
  CurrencyText({Key? key, required double value})
      : super(
          NumberFormat.currency(
            symbol: '\$',
            customPattern: '\u00a4 #.####',
            decimalDigits: 2,
          ).format(value),
          key: key,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        );
}

class CompactMoneyText extends Text {
  CompactMoneyText({Key? key, required double value})
      : super(
          NumberFormat.compact().format(value),
          key: key,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        );
}
