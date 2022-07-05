import 'package:flutter/material.dart';

class SubtitleText extends Text {
  SubtitleText({Key? key, required String name})
      : super(
          name,
          key: key,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        );
}
