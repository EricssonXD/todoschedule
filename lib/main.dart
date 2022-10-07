import 'package:flutter/material.dart';
import 'package:todoschedule/todolist/providers/index.dart';
import 'frame/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodolistProvider>(
            create: (_) => TodolistProvider()),
      ],
      child: MaterialApp(
        title: 'TodoSchedule',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFFF8FBFF),
        Color(0xFFFCFDFD),
      ])),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: HomeFrame(),
      ),
    );
  }
}
