import 'package:flutter/material.dart';
import 'package:learning_course_shop/core/core.dart';

enum DialogType {
  success,
  error,
  warning,
}

Future<T> showAppAlertDialog<T>(
  BuildContext context, {
  required String title,
  required String message,
  Map<String, dynamic>? errors,
  // required DialogType type,
}) async {
  // write assert if type is DialogType.error, erros is required. write also the message assert


  return await showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    useRootNavigator: false,
    builder: (_) {
      return AlertDialog.adaptive(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: context.textTheme.titleMedium,
              ),
            if (errors != null)
              ...errors.entries
                  .map(
                    (e) => Text(
                      '${e.key}: ${e.value}',
                      style: TextStyle(
                        color: context.theme.colorScheme.error,
                      ),
                    ),
                  )
                  .toList(),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(_),
            child: const Text('Ok'),
          )
        ],
      );
    },
  );
}
