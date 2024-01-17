import 'package:flutter/material.dart';

 import '../resources.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const ClickableText({Key? key, this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppText(
        text: text,
        style: bold15.copyWith(
            decoration: TextDecoration.underline, color: mainColor),
      ),
    );
  }
}
