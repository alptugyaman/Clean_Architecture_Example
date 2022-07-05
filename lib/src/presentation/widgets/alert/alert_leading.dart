import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertLeading extends StatelessWidget {
  const AlertLeading({
    Key? key,
    required double percent,
  })  : _percent = percent,
        super(key: key);

  final double _percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(maxWidth: .125.sw),
      child: Column(
        children: [
          if (_percent > 0) ...[
            const Icon(
              Icons.arrow_upward,
              size: 20,
              color: Colors.green,
            ),
          ],
          Text(
            _percent.toStringAsFixed(3),
            style: TextStyle(
              color: _percent > 0
                  ? Colors.green
                  : _percent < 0
                      ? Colors.red.shade800
                      : Colors.grey,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (_percent < 0) ...[
            const Icon(
              Icons.arrow_downward,
              size: 20,
              color: Colors.red,
            ),
          ],
        ],
      ),
    );
  }
}
