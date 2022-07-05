import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return _theme.copyWith(
      textTheme: GoogleFonts.interTextTheme(_theme.textTheme),
    );
  }

  static ThemeData get _theme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF14121E),
        canvasColor: const Color(0xFF14121E),
        scaffoldBackgroundColor: const Color(0xFF14121E),
        appBarTheme: _appBarTheme(),
        cardTheme: _cardDecorationTheme(),
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Color(0xff3365b0),
          selectionHandleColor: Color(0xff3365b0),
          cursorColor: Color(0xff3365b0),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      );

  static AppBarTheme _appBarTheme() => AppBarTheme(
        elevation: 5,
        centerTitle: true,
        backgroundColor: const Color(0xFF14121E),
        titleTextStyle: GoogleFonts.bebasNeue(
          textStyle: TextStyle(
            letterSpacing: .5,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  static CardTheme _cardDecorationTheme() {
    return const CardTheme(
      color: Color(0xff262334),
    );
  }
}
