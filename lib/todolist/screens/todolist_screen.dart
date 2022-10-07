import 'package:flutter/material.dart';
import 'package:todoschedule/frame/index.dart';
import 'package:todoschedule/todolist/index.dart';
import 'package:todoschedule/utils/responsive_layout.dart';

class TodolistScreen extends StatelessWidget {
  const TodolistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodolistProvider>(
      create: (_) => TodolistProvider(),
      builder: (context, child) {
        return const ResponsivePlatform(
          webScreen: _Web(),
          windowsScreen: _Windows(),
          androidScreen: _Android(),
        );
      },
    );
  }
}

class _Web extends StatelessWidget {
  const _Web({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("I am WebView");
  }
}

class _Windows extends StatelessWidget {
  const _Windows({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("I am Windows"),
        _Content(),
      ],
    );
  }
}

class _Android extends StatelessWidget {
  const _Android({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("ahhh");
  }
}

class _Content extends StatefulWidget {
  const _Content({super.key});

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  void _addTodo() {
    context.read<TodolistProvider>().addTodo(task: "yeet");
  }

  @override
  void initState() {
    context.read<TodolistProvider>().todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Text("Sadge");
    return Expanded(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        floatingActionButton: FloatingActionButton(
          onPressed: _addTodo,
          child: const Icon(Icons.add),
        ),
        body: Text(""),
      ),
    );
  }
}
