import 'package:flutter/material.dart';

class CustomLabeledRadio<T> extends StatefulWidget {
  const CustomLabeledRadio({
    super.key,
    required this.label,
    required this.groupValue,
    required this.value,
    required this.onChanged,
    required this.selectedIcon,
    required this.unSelectedIcon,
  });

  final String label;
  final T groupValue;
  final T value;
  final ValueChanged<T?> onChanged;
  final IconData selectedIcon;
  final IconData unSelectedIcon;

  @override
  State<CustomLabeledRadio<T>> createState() => _CustomLabeledRadioState<T>();
}

class _CustomLabeledRadioState<T> extends State<CustomLabeledRadio<T>> {
  IconData? icon;

  @override
  void initState() {
    super.initState();
    if (widget.value == widget.groupValue) {
      icon = widget.selectedIcon;
    } else {
      icon = widget.unSelectedIcon;
    }
  }

  @override
  void didUpdateWidget(covariant CustomLabeledRadio<T> oldWidget) {
    // rebuild widget between selectedIcon and unSelectedIcon if value != groupValue
    if (widget.value == widget.groupValue) {
      icon = widget.selectedIcon;
    } else {
      icon = widget.unSelectedIcon;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: <Widget>[
          Radio<T>(
            groupValue: widget.groupValue,
            value: widget.value,
            onChanged: widget.onChanged,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          Text(widget.label),
          const Spacer(),
          Icon(icon),
        ],
      ),
    );
  }
}
