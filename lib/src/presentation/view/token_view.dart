import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokens/main.dart';
import 'package:tokens/src/config/router/app_router.dart';
import 'package:tokens/src/core/components/circular_progress_indicator/adaptive_circular.dart';
import 'package:tokens/src/presentation/bloc/token/token_bloc.dart';
import 'package:tokens/src/presentation/widgets/token/token_header_widget.dart';
import 'package:tokens/src/presentation/widgets/token/token_list_widget.dart';

class TokenView extends StatefulWidget {
  const TokenView({Key? key}) : super(key: key);

  @override
  State<TokenView> createState() => _TokenViewState();
}

class _TokenViewState extends State<TokenView> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    context.read<TokenBloc>().add(const OnTokensFetched());
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (context.read<TokenBloc>().more) {
        context.read<TokenBloc>().add(const OnTokensFetched());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TokenBloc, TokenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.5,
            title: const Text('Profit Tracker'),
            bottom: state is TokenHasData ? _bottom() : null,
            actions: state is TokenHasData ? _action(context) : null,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: BlocBuilder<TokenBloc, TokenState>(
              builder: (context, state) {
                if (state is TokenInitial) {
                  return const AdaptiveCircularProgress();
                } else if (state is TokenError) {
                  return Center(child: Text(state.message));
                }

                return TokenList(controller: scrollController);
              },
            ),
          ),
        );
      },
    );
  }

  PreferredSize _bottom() {
    return PreferredSize(
      child: const Header(),
      preferredSize: Size(1.sw, 56.0),
    );
  }

  List<Widget> _action(BuildContext context) {
    return [
      IconButton(
        onPressed: () => router.push(
            AlertRoute(token: context.read<TokenBloc>().listings!.token!)),
        icon: const Icon(Icons.notifications),
      ),
      SizedBox(width: 5.w),
    ];
  }
}
