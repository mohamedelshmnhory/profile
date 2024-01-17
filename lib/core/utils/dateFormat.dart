import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profile/core/dependencies/dependency_init.dart';
import 'package:profile/core/language/repository/langauge_repository.dart';
// import 'package:timeago/timeago.dart' as timeago;
// import 'package:get/get.dart';

// String buildTimeAgo(String? date) {
//   if (date == null) return '_';
//   return timeago.format(DateTime.parse(date), locale: Get.locale!.languageCode);
// }

String buildDateFormat(String? date) {
  if (date == null) return '_';
  return DateFormat('y-MM-dd').format(DateTime.parse(date)); //"2020-01-01"
}

String buildDateTimeFormat(String? date) {
  if (date == null) return '_';
  return DateFormat('y-M-d\n').add_jm().format(DateTime.parse(date)); //"2020-01-01\n16:00"
}

String buildDateYMDHMFormat(String? date) {
  if (date == null) return '_';
  return DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(date));
}

String buildDateHMFormat(String? date) {
  if (date == null) return '_';
  return DateFormat('HH:mm').format(DateTime.parse(date));
}

String buildDateYMDFormat(String? date) {
  if (date == null) return '_';
  return DateFormat('yyyy-MM-dd').format(DateTime.parse(date)); //"2020-01-01"
}

TimeOfDay stringToTimeOfDay(String? tod) {
  if (tod == null) return const TimeOfDay(hour: 0, minute: 0);
  final format = tod.length > 6
      ? DateFormat().add_Hms() //"16:00"
      : DateFormat().add_Hm(); //"16:00:00"
  return TimeOfDay.fromDateTime(format.parse(tod));
}

String toHMS(Duration time) {
  var hour = time.inHours;
  var min = time.inMinutes % 60;
  var sec = time.inSeconds % 60;

  return '${zero(hour)}:${zero(min)}:${zero(sec)}';
}

String zero(int t) {
  return t < 10 ? '0$t' : '$t';
}

extension DateTimeExtension on DateTime {
  String get ymd => DateFormat('yyyy-MM-dd', getIt<LanguageRepository>().languageValue).format(this);
}
