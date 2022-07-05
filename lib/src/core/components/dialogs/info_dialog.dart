import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokens/src/core/components/dialogs/custom_simple_dialog.dart';

class InfoDialog extends StatefulWidget {
  final String content;

  const InfoDialog({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  _InfoDialogState createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: CustomSimpleDialog(
        title: 'BRAVO',
        children: <Widget>[
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.content,
              style: TextStyle(color: Colors.white70, fontSize: 12.sp),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          Divider(thickness: 1, color: Colors.grey.shade800),
          Center(
            child: SimpleDialogOption(
              child: Text(
                'OKAY',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade300,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}

extension Info on InfoDialog {
  Future<T?> show<T>(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return this;
      },
    );
  }
}
