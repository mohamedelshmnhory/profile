import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InitWidget extends StatelessWidget {
  final Widget child;
  const InitWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'lang',
      useOnlyLangCode: true,
      startLocale: const Locale('ar'),
      useFallbackTranslations: true,
      fallbackLocale: const Locale('ar'),
      child: child,
    );
  }
}
