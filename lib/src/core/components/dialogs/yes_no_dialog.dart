import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokens/src/core/components/dialogs/custom_simple_dialog.dart';
import 'package:tokens/src/core/components/dialogs/dialog_content.dart';

class YesNoDialog extends StatefulWidget {
  final String content;
  final void Function()? confirm;

  const YesNoDialog({
    Key? key,
    required this.content,
    required this.confirm,
  }) : super(key: key);

  @override
  _YesNoDialogState createState() => _YesNoDialogState();
}

class _YesNoDialogState extends State<YesNoDialog> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: CustomSimpleDialog(
        title: 'WARNING!',
        children: <Widget>[
          const SizedBox(height: 10),
          DialogsContent(content: widget.content),
          const SizedBox(height: 10),
          Divider(thickness: 1, color: Colors.grey.shade800),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleDialogOption(
                child: Text(
                  'CANCEL',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              SimpleDialogOption(
                child: Text(
                  'CONFIRM',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade300,
                  ),
                ),
                onPressed: widget.confirm,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

extension YesNo on YesNoDialog {
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
