import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;

class DateDialog {
  DateDialog._();

  static DateDialog _instance = DateDialog._();

  static DateDialog get instance => _instance;

  static void newInstance() => _instance = DateDialog._();

  Future<void> showDatePicker({
    required BuildContext context,
    final DateTime? minDate,
    final DateTime? maxDate,
    final DateTime? selected,
    required Function(DateTime date) onDateSelected,
  }) async {
    DateTime selectedDate = selected ?? DateTime.now();

    final DateTime? picked = await material.showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: minDate ?? DateTime(DateTime.now().year - 5),
      lastDate: maxDate ?? DateTime(DateTime.now().year + 5),
      useRootNavigator: false,
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }
}
