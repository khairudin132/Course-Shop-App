import 'package:flutter/material.dart';
import 'package:learning_course_shop/core/core.dart';

class LearningTextFormField extends StatelessWidget {
  const LearningTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    required this.label,
    this.hintText,
    this.errorText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.validator,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String label;
  final String? hintText;
  final String? errorText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style:
          context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        errorText: errorText,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints.tightFor(
          width: 40,
          height: 40,
        ),
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints.tightFor(
          width: 40,
          height: 40,
        ),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
