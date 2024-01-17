part of '../../../core/language/bloc/language_cubit.dart';

abstract class LanguageState extends Equatable {
  const LanguageState(this.language);
  final String language;
  @override
  List<Object> get props => [];
}

class LanguageInitial extends LanguageState {
  LanguageInitial() : super(LanguageEnum.ar.name);
}

class LanguageStateChanged extends LanguageState {
  LanguageStateChanged(super.language);

  final DateTime dateTime = DateTime.now();
  @override
  List<Object> get props => [dateTime];
}
