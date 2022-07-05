import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tokens/src/domain/entities/token/token.dart';

class TokenStats extends StatelessWidget {
  const TokenStats({
    Key? key,
    required this.token,
  }) : super(key: key);

  final Token token;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(0.05.sw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '${token.symbol} Price Statistics',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              '${token.name} Price Today',
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.grey.shade500,
              ),
            ),
            const Divider(),
            Tiles(
              titleWidget: Text('${token.name} Price', style: firstsStyle),
              trailingWidget: Text(
                NumberFormat.currency(
                  symbol: '\$',
                  decimalDigits: 2,
                ).format(token.quote!.usd!.price!),
                style: secondsStyle,
              ),
            ),
            const Divider(),
            Tiles(
              titleWidget: Text('Price Change', style: firstsStyle),
              trailingWidget: SizedBox(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      token.quote!.usd!.percentChange24h!
                              .toString()
                              .contains('-')
                          ? Icons.arrow_downward
                          : Icons.arrow_upward,
                    ),
                    Text(
                      '${token.quote!.usd!.percentChange24h!.toStringAsFixed(2)}%',
                      style: secondsStyle,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Tiles(
              titleWidget: Text('Trading Volume (24h)', style: firstsStyle),
              trailingWidget: Text(
                NumberFormat.currency(
                  symbol: '\$ ',
                  decimalDigits: 2,
                ).format(token.quote!.usd!.volume24h!),
                style: secondsStyle,
              ),
            ),
            const Divider(),
            Tiles(
              titleWidget: Text('Market Cap', style: firstsStyle),
              trailingWidget: Text(
                NumberFormat.currency(
                  symbol: '\$ ',
                  decimalDigits: 2,
                ).format(token.quote!.usd!.marketCap!),
                style: secondsStyle,
              ),
            ),
            const Divider(),
            Tiles(
              titleWidget: Text('Fully Diluted Market Cap', style: firstsStyle),
              trailingWidget: Text(
                NumberFormat.currency(
                  symbol: '\$ ',
                  decimalDigits: 2,
                ).format(token.quote!.usd!.fullyDilutedMarketCap!),
                style: secondsStyle,
              ),
            ),
            const Divider(),
            Tiles(
              titleWidget: Text('Market Dominance', style: firstsStyle),
              trailingWidget: Text(
                '${token.quote!.usd!.marketCapDominance}',
                style: secondsStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle get secondsStyle {
    return TextStyle(
      color: Colors.white,
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle get firstsStyle {
    return TextStyle(
      color: Colors.white54,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
    );
  }
}

class Tiles extends StatelessWidget {
  const Tiles({
    Key? key,
    required this.titleWidget,
    required this.trailingWidget,
  }) : super(key: key);

  final Widget titleWidget;
  final Widget trailingWidget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: titleWidget,
      trailing: trailingWidget,
    );
  }
}
