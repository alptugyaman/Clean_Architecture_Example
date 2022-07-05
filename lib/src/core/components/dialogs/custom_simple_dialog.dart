import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSimpleDialog extends StatelessWidget {
  const CustomSimpleDialog({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  final String title;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      titleTextStyle: TextStyle(
        color: Colors.amber,
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
      ),
      title: Center(child: Text(title)),
      children: children,
    );
  }
}
