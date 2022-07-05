import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokens/src/core/components/dialogs/yes_no_dialog.dart';
import 'package:tokens/src/domain/entities/alert_tokens.dart';
import 'package:tokens/src/presentation/bloc/alerts/alerts_bloc.dart';

class AlertTrailing extends StatelessWidget {
  const AlertTrailing({
    Key? key,
    required this.alerts,
  }) : super(key: key);

  final AlertTokens alerts;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.centerLeft,
      constraints: BoxConstraints(maxWidth: .1.sw),
      onPressed: () {
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
      icon: const Icon(Icons.delete),
    );
  }
}
