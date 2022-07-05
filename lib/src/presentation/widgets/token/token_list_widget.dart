import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokens/src/presentation/bloc/token/token_bloc.dart';
import 'package:tokens/src/presentation/widgets/token/token_widget.dart';

class TokenList extends StatelessWidget {
  const TokenList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    if (context.read<TokenBloc>().listings == null) {
      return const Center(child: CircularProgressIndicator.adaptive());
    } else {
      return ListView(
        controller: controller,
        key: const Key('4TEST'),
        children: [
          ...context
              .read<TokenBloc>()
              .listings!
              .token!
              .map((e) => TokenView(token: e))
              .toList(),
          if (context.read<TokenBloc>().more) ...[
            Container(
              alignment: Alignment.center,
              height: 80,
              child: const CircularProgressIndicator.adaptive(),
            )
          ]
        ],
      );
    }
  }
}
