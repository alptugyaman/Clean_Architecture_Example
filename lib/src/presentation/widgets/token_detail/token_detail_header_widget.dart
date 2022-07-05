import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokens/src/domain/entities/token/token.dart';
import 'package:tokens/src/domain/entities/token_details/token_detail.dart';

class TokenDetailHeader extends StatelessWidget {
  const TokenDetailHeader({
    Key? key,
    required this.tokenDetail,
    required this.token,
  }) : super(key: key);

  final TokenDetail tokenDetail;
  final Token token;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: .05.sw),
      child: Container(
        constraints: BoxConstraints(maxWidth: .9.sw),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 32.sp,
              width: 32.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    tokenDetail.logo!,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              constraints: BoxConstraints(maxWidth: .35.sw),
              child: AutoSizeText(
                tokenDetail.name!,
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.grey.shade200,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                minFontSize: 14,
              ),
            ),
            const Expanded(child: SizedBox()),
            Card(
              child: Container(
                margin: const EdgeInsets.all(2.5),
                padding: const EdgeInsets.all(6),
                child: Text(
                  'RANK #${token.cmcRank}',
                  style: TextStyle(fontSize: 8.sp),
                ),
              ),
            ),
            Card(
              child: Container(
                margin: const EdgeInsets.all(2.5),
                padding: const EdgeInsets.all(6),
                child: Text(
                  tokenDetail.symbol!,
                  style: TextStyle(fontSize: 8.sp),
                ),
              ),
            ),
            Card(
              child: Container(
                margin: const EdgeInsets.all(2.5),
                padding: const EdgeInsets.all(6),
                child: Text(
                  tokenDetail.category!.toUpperCase(),
                  style: TextStyle(fontSize: 8.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
