import 'package:flutter/material.dart';
import 'package:learning_course_shop/ui/ui.dart';

class LearningPasswordFormField extends StatefulWidget {
  const LearningPasswordFormField({
    super.key,
    required this.label,
    this.controller,
    this.validator,
  });

  final String label;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  @override
  State<LearningPasswordFormField> createState() =>
      _LearningPasswordFormFieldState();
}

class _LearningPasswordFormFieldState extends State<LearningPasswordFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final togglePasswordIcon = obscureText == true
        ? Icon(AppIconsAdaptive.visibilityOff)
        : Icon(AppIconsAdaptive.visibility);

    return LearningTextFormField(
      controller: widget.controller,
      label: widget.label,
      hintText: '********',
      obscureText: obscureText,
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: Icon(AppIconsAdaptive.password),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: togglePasswordIcon,
      ),
      validator: widget.validator,
    );
  }
}
