import 'package:flutter/material.dart';

class ShowSnakeBar extends SnackBar {
  ShowSnakeBar({
    super.key,
    required this.message,
    super.showCloseIcon,
  }) : super(
          content: Text(message ?? 'Error occured'),
        );

  final String? message;
}
