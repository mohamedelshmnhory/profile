import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static Size? size;
  static double? screenWidth;
  static double? screenHeight;

  static init(BuildContext context) {
    if (_mediaQueryData == null) {
      _mediaQueryData = MediaQuery.of(context);
      size = _mediaQueryData!.size;
      screenWidth = _mediaQueryData!.size.width;
      screenHeight = _mediaQueryData!.size.height;
    }
  }

  static double getH(num height) => height.h;
  static double getW(num width) => width.w;
  static double getFontSize(num size) => size.sp;
  static double getR(num radius) => radius.r;
}

SizedBox sizedBoxH(double h) => SizedBox(height: SizeConfig.getH(h));
SizedBox sizedBoxW(double w) => SizedBox(width: SizeConfig.getW(w));