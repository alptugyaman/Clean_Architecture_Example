import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokens/src/domain/entities/token_details/token_detail.dart';

class TokenDetailContracts extends StatelessWidget {
  const TokenDetailContracts({
    Key? key,
    required this.tokenDetail,
  }) : super(key: key);

  final TokenDetail tokenDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            Divider(height: 0, color: Colors.grey.shade700),
        shrinkWrap: true,
        itemCount: tokenDetail.contractAddress!.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final _contracts = tokenDetail.contractAddress![index];
          return ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(
              '${_contracts.platform!.name!} (${_contracts.platform!.coin!.symbol!})',
              style: TextStyle(fontSize: 12.sp),
            ),
            subtitle: Text(
              _contracts.contractAddress!,
              style: TextStyle(fontSize: 10.sp),
            ),
          );
        },
      ),
    );
  }
}
