import 'package:flutter/material.dart';
import 'package:learning_course_shop/core/core.dart';

import 'buttons/buttons.dart';

class PageBase extends StatelessWidget {
  const PageBase({
    super.key,
    this.appBar,
    this.endDrawer,
    required this.child,
    this.hasBottomGap = false,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.isFloatingActionButtonExpanded = true,
    this.hasBodyPadding = true,
  });

  final PreferredSizeWidget? appBar;
  final Widget? endDrawer;
  final Widget child;
  final bool hasBottomGap;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool isFloatingActionButtonExpanded;
  final bool hasBodyPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        bottom: false,
        maintainBottomViewPadding: true,
        child: Scaffold(
          appBar: appBar,
          endDrawer: endDrawer,
          body: Padding(
            padding:
                hasBodyPadding ? const EdgeInsets.all(16.0) : EdgeInsets.zero,
            child: Column(
              children: [
                Expanded(child: child),
                if (hasBottomGap) const SizedBox(height: 30),
              ],
            ),
          ),
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: isFloatingActionButtonExpanded
              ? SizedBox(
                  width: context.mediaQuery.size.width - 32,
                  child: floatingActionButton,
                )
              : floatingActionButton,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}

class FormPageBase extends StatelessWidget {
  const FormPageBase({
    super.key,
    required this.formKey,
    required this.title,
    required this.children,
    required this.button,
  });

  final Key formKey;
  final String title;
  final List<Widget> children;
  final ConfirmButton button;

  @override
  Widget build(BuildContext context) {
    return PageBase(
      appBar: AppBar(
        title: Text(title),
      ),
      hasBottomGap: true,
      floatingActionButton: button,
      child: Form(
        key: formKey,
        child: Column(
          children: children.separatorListWidget(const SizedBox(height: 25)),
        ),
      ),
    );
  }
}
