import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/core/enums/langauge.dart';

import '../language/repository/langauge_repository.dart';
import '../dependencies/dependency_init.dart';
import 'colors.dart';

const String hacen = 'Hacen-Tunisia';
const String lato = 'Lato-Regular';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: mainColor, // Your accent color
  ),
  fontFamily: getIt<LanguageRepository>().languageValue == LanguageEnum.ar.name ? hacen : lato,
  scaffoldBackgroundColor: Colors.white,
  canvasColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: mainColor,
    titleSpacing: 20.0.sp,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: mainColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: mainColor, // navigation bar color
      systemNavigationBarDividerColor: mainColor,
    ),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 16.0.sp,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: white,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: mainColor,
    elevation: 5,
    // selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
    backgroundColor: Colors.transparent,
  ),
  // textTheme: TextTheme(
  //   headline3: TextStyle(
  //     color: mainColor,
  //     fontSize: 16.sp,
  //     fontWeight: FontWeight.bold,
  //   ),
  // ),
  iconTheme: const IconThemeData(color: mainColor),
);
