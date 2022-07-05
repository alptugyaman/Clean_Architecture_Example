import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogsContent extends StatelessWidget {
  const DialogsContent({
    Key? key,
    required this.content,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        content,
        style: TextStyle(color: Colors.white70, fontSize: 12.sp),
        textAlign: TextAlign.center,
      ),
    );
  }
}
