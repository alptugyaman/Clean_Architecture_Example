import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = GoogleFonts.bebasNeue(
      fontSize: 14.sp,
      color: Colors.grey.shade500,
    );
    return Column(
      children: [
        const Divider(height: 0),
        ListTile(
          tileColor: Theme.of(context).scaffoldBackgroundColor,
          leading: const SizedBox(),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('PAIR', style: textStyle),
              Text('PRICE', style: textStyle),
            ],
          ),
          trailing: Container(
            alignment: Alignment.center,
            child: Text('24H Chg', style: textStyle),
            constraints: const BoxConstraints(
              minWidth: 50,
              minHeight: 25,
              maxHeight: 35,
              maxWidth: 65,
            ),
          ),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
