import 'package:flutter/material.dart';
import 'package:profile/core/resources.dart';
import 'package:profile/core/language/repository/langauge_repository.dart';

import '../../dependencies/dependency_init.dart';
import '../../enums/langauge.dart';
import '../bloc/language_cubit.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.language, color: blue),
      onPressed: () {
        final language = getIt<LanguageRepository>().languageValue;
        final lang = language == LanguageEnum.en.name ? LanguageEnum.ar.name : LanguageEnum.en.name;
        getIt<LanguageCubit>().setLanguage(lang, context);
      },
      label: AppText(
        text: AppStrings.language,
        style: bold18.copyWith(color: white),
      ),
    );
  }
}
