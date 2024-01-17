import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as el;

import '../dependencies/dependency_init.dart';
import '../styles/appStyles.dart';
import '../language/repository/langauge_repository.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final int? maxLines;
  const AppText({super.key, required this.text, this.style, this.textAlign, this.maxLines, this.textDirection});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr(),
      style: style ?? meduim16,
      textAlign: textAlign,
      textDirection: textDirection ?? (getIt<LanguageRepository>().languageValue == 'ar' ? TextDirection.rtl : TextDirection.ltr),
      maxLines: maxLines,
    );
  }
}
