import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppHeightBox extends StatelessWidget {
  final num height;

  const AppHeightBox({Key? key, required this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}

class AppWidthBox extends StatelessWidget {
  final num width;
  const AppWidthBox({Key? key, required this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
    );
  }
}

extension Boxes on num {
  Widget widthBox() {
    return AppWidthBox(width: this);
  }

  Widget heightBox() {
    return AppHeightBox(height: this);
  }
}
