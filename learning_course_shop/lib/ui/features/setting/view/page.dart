import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_course_shop/core/utils/utils.dart';
import 'package:learning_course_shop/ui/ui.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  static const String path = '/SettingScreen';

  @override
  Widget build(BuildContext context) {
    return PageBase(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      child: const Column(
        children: [
          ExpansionTile(
            title: Text('Theme Mode'),
            children: [
              _ThemeModeSetting(),
            ],
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          ExpansionTile(
            title: Text('Language'),
            children: [
              Text('Coming soon'),
            ],
          ),
        ],
      ),
    );
  }
}

class _ThemeModeSetting extends ConsumerWidget {
  const _ThemeModeSetting();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeModeSettingProvider);

    return Column(
      children: [
        CustomLabeledRadio(
          label: 'System',
          selectedIcon: AppIconsAdaptive.mobilePhoneFilled,
          unSelectedIcon: AppIconsAdaptive.mobilePhone,
          value: ThemeMode.system,
          groupValue: theme,
          onChanged: (value) {
            ref.read(themeModeSettingProvider.notifier).setThemeMode(value!);
          },
        ),
        CustomLabeledRadio(
          label: 'Light',
          selectedIcon: AppIconsAdaptive.sunFilled,
          unSelectedIcon: AppIconsAdaptive.sun,
          value: ThemeMode.light,
          groupValue: theme,
          onChanged: (value) {
            ref.read(themeModeSettingProvider.notifier).setThemeMode(value!);
          },
        ),
        CustomLabeledRadio(
          label: 'Dark',
          selectedIcon: AppIconsAdaptive.moonFilled,
          unSelectedIcon: AppIconsAdaptive.moon,
          value: ThemeMode.dark,
          groupValue: theme,
          onChanged: (value) {
            ref.read(themeModeSettingProvider.notifier).setThemeMode(value!);
          },
        ),
      ],
    );
  }
}
