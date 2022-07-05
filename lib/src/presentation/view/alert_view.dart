import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokens/src/core/components/circular_progress_indicator/adaptive_circular.dart';
import 'package:tokens/src/domain/entities/token/token.dart';
import 'package:tokens/src/presentation/bloc/alerts/alerts_bloc.dart';
import 'package:tokens/src/presentation/widgets/alert/alert_grid_view.dart';
import 'package:tokens/src/presentation/widgets/alert/alert_list_view.dart';

class AlertView extends StatefulWidget {
  const AlertView({Key? key, required this.token}) : super(key: key);
  final List<Token> token;
  @override
  State<AlertView> createState() => _AlertViewState();
}

class _AlertViewState extends State<AlertView> {
  bool listView = true;

  void changeView() {
    setState(() {
      listView = !listView;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<AlertsBloc>().add(const GetAlertTokens());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerts'),
        actions: [
          IconButton(
            icon: listView
                ? const Icon(Icons.grid_on)
                : const Icon(Icons.list_sharp),
            onPressed: () => changeView(),
          ),
          SizedBox(width: 5.w),
        ],
      ),
      body: BlocBuilder<AlertsBloc, AlertsState>(
        builder: (context, state) {
          if (state is AlertsInitial) {
            return const AdaptiveCircularProgress();
          } else if (state is AlertError) {
            return Center(child: Text(state.message));
          } else if (state is AlertHasData) {
            return listView
                ? AlertsListView(
                    alertTokens: state.alertTokens,
                    tokens: widget.token,
                  )
                : AlertsGridView(
                    alertTokens: state.alertTokens,
                    tokens: widget.token,
                  );
          } else if (state is AlertsEmpty) {
            return const Center(child: Text('No tokens found to list'));
          }
          return const AdaptiveCircularProgress();
        },
      ),
    );
  }
}
