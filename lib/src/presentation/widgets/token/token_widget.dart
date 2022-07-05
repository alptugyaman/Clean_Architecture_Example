import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tokens/main.dart';
import 'package:tokens/src/config/router/app_router.dart';
import 'package:tokens/src/core/components/container/percent24.dart';
import 'package:tokens/src/core/components/dialogs/info_dialog.dart';
import 'package:tokens/src/core/functions/calculations.dart';
import 'package:tokens/src/domain/entities/alert_tokens.dart';
import 'package:tokens/src/domain/entities/token/token.dart';
import 'package:tokens/src/presentation/bloc/alerts/alerts_bloc.dart';
import 'package:tokens/src/presentation/widgets/token/token_tile_widget.dart';

class TokenView extends StatelessWidget {
  const TokenView({Key? key, required this.token}) : super(key: key);

  final Token token;

  @override
  Widget build(BuildContext context) {
    return SlidableWigdet(token: token);
  }
}

class SlidableWigdet extends StatelessWidget {
  const SlidableWigdet({
    Key? key,
    required this.token,
  }) : super(key: key);

  final Token token;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: .225,
        children: [
          SlidableAction(
            spacing: 6,
            borderRadius: BorderRadius.circular(6),
            onPressed: (_) {
              String dateString = dateToString();
              AlertTokens alertTokens = AlertTokens(
                name: token.name!,
                price: token.quote!.usd!.price!.toStringAsFixed(2),
                favDate: dateString,
              );
              context.read<AlertsBloc>().add(InsertAlertTokens(alertTokens));
              InfoDialog(
                content:
                    '${token.name!.toUpperCase()} has been added to your alert list.',
              ).show(context);
            },
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black87,
            icon: Icons.notifications,
            label: 'Alert',
          ),
        ],
      ),
      child: ListTile(
        dense: true,
        onTap: () => router.push(TokenDetailRoute(token: token)),
        title: TokenDetailView(token: token),
        trailing: Percent24H(value: token.quote!.usd!.percentChange24h!),
      ),
    );
  }
}
