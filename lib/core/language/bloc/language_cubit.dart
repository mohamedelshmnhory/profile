import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:profile/core/enums/langauge.dart';

import '../repository/langauge_repository.dart';

part 'language_state.dart';

@Singleton()
class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(this.languageRepository) : super(LanguageInitial());
  LanguageRepository languageRepository;

  appStart() async {
    debugPrint("LanguageCubit: appStart");
    await languageRepository.readLanguage();
    emit(LanguageStateChanged(languageRepository.languageValue));
  }

  setLanguage(String local, BuildContext context) async {
    await languageRepository.setLanguage(local, context);
    emit(LanguageStateChanged(languageRepository.languageValue));
  }
}
