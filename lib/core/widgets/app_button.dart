import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final Color? color;
  final Color? textcolor;

  final Color? bordrColor;

  final TextStyle? style;
  final ButtonStyle? buttonStyle;
  final String text;
  final double? paddingTop;
  final double? paddingBottom;

  const AppButton({
    Key? key,
    required this.onPressed,
    this.paddingTop,
    this.paddingBottom,
    this.bordrColor,
    this.textcolor,
    required this.text,
    this.color,
    this.buttonStyle,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        clipBehavior: Clip.hardEdge,
        style: buttonStyle ??
            ElevatedButton.styleFrom(
                primary: color ?? mainColor,
                padding: EdgeInsets.zero,
                elevation: 0,
                minimumSize: Size.fromHeight(30.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                    side: BorderSide(color: bordrColor ?? color ?? mainColor))),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: paddingTop?.h ?? 14.h,
              bottom: paddingBottom?.h ?? 12.h,
            ),
            child: AppText(
              text: text.tr(),
              style: style ?? bold15.copyWith(color: textcolor ?? white),
            ),
          ),
        ));
  }
}
