import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_course_shop/core/core.dart';

class GreetName extends StatelessWidget {
  const GreetName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _Greeting(),
        Text(
          getIt.get<AuthenticationRepo>().getUser?.name ?? '',
          style: context.textTheme.headlineLarge!
              .copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _Greeting extends StatefulWidget {
  @override
  __GreetingState createState() => __GreetingState();
}

class __GreetingState extends State<_Greeting> {
  String _greeting = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _updateTime();
    _timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    final DateTime now = DateTime.now();

    final hour = now.hour;
    String greeting = '';
    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour < 14) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }

    setState(() {
      _greeting = greeting;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hi, $_greeting',
      style: context.textTheme.titleLarge,
    );
  }
}
