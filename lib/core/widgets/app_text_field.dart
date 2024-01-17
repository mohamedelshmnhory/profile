import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources.dart';

class AppTextField extends StatelessWidget {
  final TextInputType? type;
  final String? label;
  final String hint;
  final Function()? onTap;
  final TextEditingController? textEditingController;
  final bool? readOnly;
  final bool isPassword;
  final bool? filled;
  final TextAlign textAlign;
  final Widget? suffix;
  final IconData? prefix;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? onChanged;
  final double borderRadius;
  final double? horizontalPadding;
  final int linesNum;
  final Color hintColor;

  const AppTextField(
      {super.key,
      this.type,
      this.suffix,
      this.textAlign = TextAlign.start,
      this.prefix,
      this.validator,
      this.textEditingController,
      this.onSaved,
      this.onChanged,
      this.horizontalPadding,
      this.onTap,
      this.readOnly,
      this.isPassword = false,
      this.filled = true,
      this.borderRadius = 7.0,
      this.label,
      required this.hint,
      this.linesNum = 1,
      this.hintColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: label != null,
          child: Column(
            children: [
              AppText(text: label ?? " "),
              7.heightBox(),
            ],
          ),
        ),
        TextFormField(
          keyboardType: type,
          onTap: () {
            onTap;
            if (textEditingController != null) {
              if (textEditingController!.selection ==
                  TextSelection.fromPosition(TextPosition(offset: textEditingController!.text.length - 1))) {
                textEditingController!.selection =
                    TextSelection.fromPosition(TextPosition(offset: textEditingController!.text.length));
              }
            }
          },
          onChanged: onChanged,
          controller: textEditingController,
          validator: validator,
          obscureText: isPassword,
          onSaved: onSaved,
          textAlign: textAlign,
          maxLines: linesNum,
          enabled: readOnly == true ? false : true,
          readOnly: readOnly ?? false,
          decoration: buildInputDecoration,
        ),
      ],
    );
  }

  InputDecoration get buildInputDecoration {
    return InputDecoration(
      suffixIcon: suffix,
      prefixIcon: prefix != null
          ? Icon(
              prefix,
              color: Colors.grey,
              size: SizeConfig.getFontSize(18),
            )
          : null,
      isDense: true,
      contentPadding: EdgeInsets.only(right: 12.w, left: 12.w, top: 8.h, bottom: 12.h),
      border: buildOutlineInputBorder,
      enabledBorder: buildOutlineInputBorder,
      focusedBorder: buildFOutlineInputBorder,
      hintText: hint.tr(),
      hintStyle: TextStyle(fontSize: 12.sp, color: hintColor),
      filled: filled,
      fillColor: Colors.white,
    );
  }

  OutlineInputBorder get buildFOutlineInputBorder {
    return OutlineInputBorder(
        borderSide: BorderSide(color: filled! ? mainColor : white),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius.r)));
  }

  OutlineInputBorder get buildOutlineInputBorder {
    return OutlineInputBorder(
        borderSide: BorderSide(color: filled! ? Colors.grey.shade400 : white),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius.r)));
  }
}
