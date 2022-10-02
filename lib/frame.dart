import 'package:flutter/material.dart';
import 'todolist/index.dart';
import 'utils/responsive_layout.dart';

class HomeFrame extends StatefulWidget {
  const HomeFrame({super.key});

  @override
  State<HomeFrame> createState() => _HomeFrameState();
}

class _HomeFrameState extends State<HomeFrame> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        largeScreen: Center(
          child: Column(
            children: const [
              NavBar(),
              ContentFrame(),
              Text("This is a large screen")
            ],
          ),
        ),
        smallScreen: Center(
          child: Column(
            children: const [
              NavBar(),
              ContentFrame(),
              Text("This is a small screen")
            ],
          ),
        ));
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        selectedIndex: _selectedScreenIndex,
        onDestinationSelected: _selectScreen,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.home), label: "Home2")
        ]);
  }
}

class ContentFrame extends StatefulWidget {
  const ContentFrame({super.key});

  @override
  State<ContentFrame> createState() => _ContentFrameState();
}

class _ContentFrameState extends State<ContentFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(child: TodolistScreen());
  }
}

// if(Theme.of(context).platform == TargetPlatform.android)
//     //do sth for Android
// else if(Theme.of(context).platform == TargetPlatform.iOS)
//     //do sth else for iOS
// else if(Theme.of(context).platform == TargetPlatform.fuchsia)
//     //even do sth else for Fuchsia OS

// final isWebMobile = kIsWeb &&
//     (defaultTargetPlatform == TargetPlatform.iOS ||
//         defaultTargetPlatform == TargetPlatform.android);
