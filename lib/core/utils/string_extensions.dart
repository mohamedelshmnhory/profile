

extension StringExtension on String? {
  String capitalize() {
    if (this == null || this?.isEmpty == true) {
      return this ?? "";
    }
    return (this?[0].toUpperCase() ?? '') + (this?.substring(1) ?? '');
  }
}
