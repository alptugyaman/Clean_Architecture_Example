import 'package:flutter/material.dart';
import 'package:tokens/src/core/components/text/currency_text.dart';
import 'package:tokens/src/core/components/text/token_name_subtitle.dart';
import 'package:tokens/src/core/components/text/token_pair_text.dart';
import 'package:tokens/src/domain/entities/token/token.dart';

class TokenDetailView extends StatelessWidget {
  const TokenDetailView({Key? key, required this.token}) : super(key: key);

  final Token token;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 24.0),
          child: Text(
            '${token.cmcRank}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TokenPairText(symbol: token.symbol!),
            SubtitleText(name: '${token.name}')
          ],
        ),
        const Expanded(child: SizedBox()),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CurrencyText(value: token.quote!.usd!.price!),
            CompactMoneyText(value: token.quote!.usd!.volume24h!),
          ],
        ),
      ],
    );
  }
}
