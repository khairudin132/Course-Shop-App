extension ListExtension on List? {
  // check for null and empty isNullOrEmpty
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
