import 'package:flutter/material.dart';
import 'package:todoschedule/utils/responsive_layout.dart';

class TodolistScreen extends StatelessWidget {
  const TodolistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsivePlatform(
      webScreen: _Web(),
      windowsScreen: _Windows(),
    );
  }
}

class _Web extends StatelessWidget {
  const _Web({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("I am WebView");
  }
}

class _Windows extends StatelessWidget {
  const _Windows({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("I am Windows");
  }
}
