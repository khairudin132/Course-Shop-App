extension StringExtension on String? {
  // check for null and empty isNullOrEmpty
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
