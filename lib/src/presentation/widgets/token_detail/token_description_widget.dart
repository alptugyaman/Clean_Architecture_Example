import 'package:flutter/material.dart';
import 'package:tokens/src/domain/entities/token_details/token_detail.dart';

class TokenDescription extends StatelessWidget {
  const TokenDescription({
    Key? key,
    required this.tokenDetail,
  }) : super(key: key);

  final TokenDetail tokenDetail;

  @override
  Widget build(BuildContext context) {
    return Text(
      tokenDetail.description!,
      style: TextStyle(fontSize: 12, color: Colors.grey.shade300),
    );
  }
}
