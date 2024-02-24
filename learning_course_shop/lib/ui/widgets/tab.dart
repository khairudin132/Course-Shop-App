import 'package:flutter/material.dart';
import 'package:learning_course_shop/core/core.dart';

class CustomTabState extends InheritedWidget {
  const CustomTabState({
    super.key,
    required super.child,
    this.index = 0,
    required this.tabs,
  });

  final int index;
  final List<TabViewItem> tabs;

  static CustomTabState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CustomTabState>());
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return index != (oldWidget as CustomTabState).index;
  }
}

class TabViewItem {
  const TabViewItem({
    required this.label,
    required this.view,
  });

  final String label;
  final Widget view;
}

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
  });

  final List<TabViewItem> tabs;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return CustomTabState(
      tabs: widget.tabs,
      index: _index,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _TabBar(
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
          ),
          _TabView(),
        ],
      ),
    );
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar({
    required this.onTap,
  });

  final void Function(int value) onTap;

  @override
  Widget build(BuildContext context) {
    final tabs = CustomTabState.of(context)?.tabs ?? [];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 33,
          child: ListView.builder(
            itemCount: tabs.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _TabBarItem(
                onTap: onTap,
                index: index,
                tab: tabs[index],
              );
            },
          ),
        ),
        const Divider(),
      ],
    );
  }
}

class _TabBarItem extends StatelessWidget {
  const _TabBarItem({
    required this.index,
    required this.tab,
    required this.onTap,
  });

  final int index;
  final TabViewItem tab;
  final void Function(int value) onTap;

  @override
  Widget build(BuildContext context) {
    bool isActive = false;
    var width = 0.0;

    final getIndex = CustomTabState.of(context)?.index;
    final tabs = CustomTabState.of(context)?.tabs ?? [];

    if (getIndex == index) {
      isActive = true;
    } else {
      isActive = false;
    }

    if (tabs.isNullOrEmpty) {
      width = 0.0;
    } else if (tabs.length == 1) {
      width = context.mediaQuery.size.width - 32;
      debugPrint('width: $width');
      debugPrint('screen width: ${context.mediaQuery.size.width}');
    } else if (tabs.length == 2) {
      width = (context.mediaQuery.size.width - 32) / 2;
      debugPrint('width: $width');
      debugPrint('screen width: ${context.mediaQuery.size.width}');
    } else if (tabs.length > 2) {
      width = (context.mediaQuery.size.width - 32) / 3;
      debugPrint('width: $width');
      debugPrint('screen width: ${context.mediaQuery.size.width}');
    }

    return GestureDetector(
      onTap: () => onTap(index),
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              tab.label,
              style: context.textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            if (isActive)
              Container(
                height: 5,
                width: 60,
                decoration: BoxDecoration(
                    color: context.theme.colorScheme.primary,
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
              ),
          ],
        ),
      ),
    );
  }
}

class _TabView extends StatelessWidget {
  const _TabView();

  @override
  Widget build(BuildContext context) {
    final index = CustomTabState.of(context)?.index;
    final tabs = CustomTabState.of(context)?.tabs ?? [];

    return IndexedStack(
      index: index,
      children: tabs.map((e) => e.view).toList(),
    );
  }
}
