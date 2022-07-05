import 'package:flutter/material.dart';
import 'package:tokens/src/domain/entities/token_details/token_detail.dart';

class TokenTags extends StatelessWidget {
  const TokenTags({
    Key? key,
    required this.tokenDetail,
  }) : super(key: key);

  final TokenDetail tokenDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Wrap(
        children: [
          ...tokenDetail.tagNames!.map(
            (e) => Card(
              child: Container(
                margin: const EdgeInsets.all(2.5),
                padding: const EdgeInsets.all(6),
                child: Text(e, style: const TextStyle(fontSize: 12)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
