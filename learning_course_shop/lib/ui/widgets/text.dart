import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:learning_course_shop/core/core.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.header});

  final String header;

  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style: context.textTheme.headlineMedium,
    );
  }
}

class IconLabel extends StatelessWidget {
  const IconLabel({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 18,
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: context.textTheme.labelLarge,
        ),
      ],
    );
  }
}

class ExpandableText extends StatefulWidget {
  const ExpandableText({
    super.key,
    required this.text,
    this.trimLength = 100,
  });

  final String text;
  final int trimLength;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool expanded = false;
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > widget.trimLength) {
      firstHalf = widget.text.substring(0, widget.trimLength);
      secondHalf = widget.text.substring(widget.trimLength);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _toggleExpanded;
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: expanded ? (firstHalf + secondHalf) : '$firstHalf...',
            style: context.textTheme.bodyMedium,
          ),
          if (secondHalf.isNotEmpty)
            TextSpan(
              text: expanded ? ' Read less' : ' Read more',
              style: context.textTheme.bodyMedium!.copyWith(
                color: Colors.blue,
              ),
              recognizer: _tapGestureRecognizer,
            ),
        ],
      ),
    );
  }
}
