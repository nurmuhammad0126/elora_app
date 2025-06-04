import 'package:eloro_app_for_home_work/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [
        ColoredBox(color: context.colors.primary),
      ],
    ));
  }
}
