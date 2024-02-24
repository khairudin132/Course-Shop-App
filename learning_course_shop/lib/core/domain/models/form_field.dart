import 'package:flutter/cupertino.dart';

abstract class FormField<T> {
  T? get value;

  String? get label;

  String? errorText;

  String? validate(T? value);
}

class TextFieldModel implements FormField<String> {
  TextFieldModel({required this.fieldLabel, required this.controller});

  final String fieldLabel;

  final TextEditingController controller;

  @override
  String? get value => controller.text;

  @override
  String? get label => fieldLabel;

  @override
  String? errorText;

  @override
  String? validate(value) {
    if (value == null || value.isEmpty) {
      return errorText = 'Required $label';
    }
    return null;
  }
}
