import 'package:flutter/material.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:learning_course_shop/ui/ui.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.navigator.pushNamed(SettingScreen.path),
            icon: Icon(AppIconsAdaptive.setting),
          ),
        ],
      ),
      floatingActionButton: SecondaryButton(
        label: 'Edit Profile',
        onPressed: () {},
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              minRadius: 60,
            ),
          ),
          const SizedBox(height: 60),
          _LabelAndInfo(),
        ],
      ),
    );
  }
}

class _LabelAndInfo extends StatelessWidget {
  const _LabelAndInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'name',
          style: context.textTheme.titleLarge,
        ),
        const SizedBox(height: 3),
        Text(
          getIt<AuthenticationRepo>().getUser?.name ?? '',
          style: context.textTheme.labelLarge,
        ),
      ],
    );
  }
}
