import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../resources.dart';
import 'app_button.dart';

class TextIconButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final bool isSelected;
  final bool prefixIconVisibility;
  final bool suffixIconVisibility;

  const TextIconButton(
      {Key? key,
      this.onTap,
      required this.text,
      this.isSelected = false,
      this.suffixIconVisibility = false,
      this.prefixIconVisibility = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   // bool rightDirection = EasyLocalization.of(context)?.locale.languageCode == "ar";
    return Stack(
      children: [
        AppButton(
          onPressed: onTap,
          text: text.tr(),
          style: meduim16.copyWith(color: isSelected != true ? white : white),
          color: isSelected != true ? dark : mainColor,
        ),
        // Positioned(
        //     right: 16.w,
        //     top: 0,
        //     bottom: 0,
        //     child: Visibility(
        //       visible: prefixIconVisibility,
        //       child: const Center(
        //           child: Icon(
        //         Icons.check,
        //         color: Colors.white,
        //       )),
        //     )),
        // Positioned(
        //     right: !rightDirection ? 16.w : null,
        //     left: rightDirection ? 16.w : null,
        //     top: 0,
        //     bottom: 0,
        //     child: Visibility(
        //       visible: suffixIconVisibility,
        //       child: const Center(
        //           child: Icon(
        //         Icons.arrow_forward_ios,
        //         color: Colors.white,
        //       )),
        //     ))
      ],
    );
  }
}
