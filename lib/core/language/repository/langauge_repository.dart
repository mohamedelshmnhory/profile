import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:easy_localization/easy_localization.dart' as ez;

import '../../network/local/app_local_storage.dart';

@Singleton()
class LanguageRepository {
  final String _languageKey = "language";
  String languageValue = "ar";

  LanguageRepository();

  // save user locally
  Future setLanguage(String local, BuildContext context) async {
    languageValue = local;
    ez.EasyLocalization.of(context)?.setLocale(Locale(local));
    debugPrint("LanguageRepository: setLanguage: $local");
    return await AppLocalStorage.saveString(_languageKey, local);
  }

  // read string
  Future<String?> readLanguage() async {
    languageValue = await AppLocalStorage.getString(_languageKey) ?? languageValue;
    debugPrint("LanguageRepository: readLanguage: $languageValue");
    return languageValue;
  }
}
