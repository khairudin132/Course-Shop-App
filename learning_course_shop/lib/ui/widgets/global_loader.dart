// This widget should wrap your entire app, but be below MaterialApp in order to have access to the Overlay
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_course_shop/core/core.dart';

class GlobalLoadingIndicator extends ConsumerStatefulWidget {
  final Widget child;

  const GlobalLoadingIndicator({required this.child, Key? key})
      : super(key: key);

  @override
  ConsumerState createState() => _GlobalLoadingIndicatorState();
}

class _GlobalLoadingIndicatorState
    extends ConsumerState<GlobalLoadingIndicator> {
  //We need to cache the overlay entries we are showing as part of the indicator in order to remove them when the indicator is hidden.
  final List<OverlayEntry> _entries = [];

  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(appLoaderProvider, (previous, next) {
      // We just want to make changes if the states are different
      if (previous == next) return;
      if (next) {
        // Add a modal barrier so the user cannot interact with the app while the loading indicator is visible
        _entries.add(
          OverlayEntry(
            builder: (_) => ModalBarrier(
              color: Colors.black12.withOpacity(.5),
            ),
          ),
        );
        _entries.add(
          OverlayEntry(
            builder: (_) => const Center(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
          ),
        );
        // Insert the overlay entries into the overlay to actually show the loading indicator
        Overlay.of(context).insertAll(_entries);
      } else {
        // Remove the overlay entries from the overlay to hide the loading indicator
        for (var e in _entries) {
          e.remove();
        }
        // Remove the cached overlay entries from the widget state
        _entries.clear();
      }
    });
    return widget.child;
  }
}
