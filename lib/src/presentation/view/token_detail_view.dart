import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokens/src/core/components/circular_progress_indicator/adaptive_circular.dart';
import 'package:tokens/src/domain/entities/token/token.dart';
import 'package:tokens/src/domain/entities/token_details/token_detail.dart';
import 'package:tokens/src/presentation/bloc/token_detail/token_detail_bloc.dart';
import 'package:tokens/src/presentation/widgets/token_detail/token_description_widget.dart';
import 'package:tokens/src/presentation/widgets/token_detail/token_detail_contracts_widget.dart';
import 'package:tokens/src/presentation/widgets/token_detail/token_detail_header_widget.dart';
import 'package:tokens/src/presentation/widgets/token_detail/token_detail_title_widget.dart';
import 'package:tokens/src/presentation/widgets/token_detail/token_official_links_widget.dart';
import 'package:tokens/src/presentation/widgets/token_detail/token_price_changes_widget.dart';
import 'package:tokens/src/presentation/widgets/token_detail/token_stats.dart';
import 'package:tokens/src/presentation/widgets/token_detail/token_tags.dart';

class TokenDetailView extends StatefulWidget {
  const TokenDetailView({Key? key, required this.token}) : super(key: key);
  final Token token;
  @override
  State<TokenDetailView> createState() => _TokenDetailViewState();
}

class _TokenDetailViewState extends State<TokenDetailView> {
  @override
  void initState() {
    super.initState();
    context
        .read<TokenDetailBloc>()
        .add(OnTokenDetailFetched(widget.token.symbol!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.token.name!)),
      body: BlocBuilder<TokenDetailBloc, TokenDetailState>(
        builder: (context, state) {
          if (state is TokenDetailInitial) {
            return const AdaptiveCircularProgress();
          } else if (state is TokenDetailError) {
            return Center(child: Text(state.message));
          } else if (state is TokenDetailHasData) {
            return TokenDetailViewWidget(
              token: widget.token,
              tokenDetail: state.tokenDetail,
            );
          }
          return const AdaptiveCircularProgress();
        },
      ),
    );
  }
}

class TokenDetailViewWidget extends StatelessWidget {
  const TokenDetailViewWidget({
    Key? key,
    required this.token,
    required this.tokenDetail,
  }) : super(key: key);

  final Token token;
  final TokenDetail tokenDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: .05.sw),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TokenDetailHeader(tokenDetail: tokenDetail, token: token),
            TokenDescription(tokenDetail: tokenDetail),
            SizedBox(height: 10.h),
            TokenOfficialLinks(tokenDetail: tokenDetail),
            SizedBox(height: 10.h),
            TokenStats(token: token),
            SizedBox(height: 20.h),
            TokenDetailTitle(title: '${token.symbol} Price Changes'),
            TokenPriceChanges(token: token),
            SizedBox(height: 20.h),
            TokenDetailTitle(title: '${token.symbol} Contracts'),
            TokenDetailContracts(tokenDetail: tokenDetail),
            SizedBox(height: 20.h),
            TokenDetailTitle(title: '${token.symbol} Tags'),
            TokenTags(tokenDetail: tokenDetail),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
