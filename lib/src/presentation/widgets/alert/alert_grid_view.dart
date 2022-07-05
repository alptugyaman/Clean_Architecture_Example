import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokens/src/core/components/dialogs/yes_no_dialog.dart';
import 'package:tokens/src/core/functions/calculations.dart';
import 'package:tokens/src/domain/entities/alert_tokens.dart';
import 'package:tokens/src/domain/entities/token/token.dart';
import 'package:tokens/src/presentation/bloc/alerts/alerts_bloc.dart';

class AlertsGridView extends StatelessWidget {
  const AlertsGridView({
    Key? key,
    required this.alertTokens,
    required this.tokens,
  }) : super(key: key);

  final List<AlertTokens> alertTokens;
  final List<Token> tokens;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemCount: alertTokens.length,
      itemBuilder: (context, index) {
        final alerts = alertTokens[index];
        return GestureDetector(
          onTap: () {
            YesNoDialog(
              content:
                  'Are you sure you want to remove ${alerts.name} from your alert list?',
              confirm: () {
                context.read<AlertsBloc>().add(
                      RemoveAlertTokens(alerts),
                    );

                context.read<AlertsBloc>().add(
                      const GetAlertTokens(),
                    );

                Navigator.pop(context);
              },
            ).show(context);
          },
          child: Container(
            color: getColorDesicion(alerts, tokens),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(.03.sw),
                  alignment: Alignment.center,
                  width: .4.sw,
                  child: AutoSizeText(
                    alerts.name,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    minFontSize: 14,
                  ),
                ),
                Positioned(
                  bottom: .025.sw,
                  left: .025.sw,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    width: .5.sw,
                    height: .075.sw,
                    child: Text(
                      getPrice(tokens, alerts),
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: .025.sw,
                  right: .025.sw,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    width: .5.sw,
                    height: .075.sw,
                    child: Text(
                      alerts.price,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: .025.sw,
                  right: .025.sw,
                  child: Container(
                    alignment: Alignment.topRight,
                    width: .5.sw,
                    height: .075.sw,
                    child: Text(
                      getPercent(alerts, tokens).toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
