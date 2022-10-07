import 'package:flutter/material.dart';
import 'package:todoschedule/settings/screens/index.dart';
import 'package:todoschedule/utils/responsive_layout.dart';
import 'package:todoschedule/todolist/index.dart';
import '../index.dart';

class HomeFrame extends StatefulWidget {
  const HomeFrame({super.key});

  @override
  State<HomeFrame> createState() => _HomeFrameState();
}

class _HomeFrameState extends State<HomeFrame> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FrameProvider>(
        create: (_) => FrameProvider(),
        builder: (context, child) {
          return ResponsiveLayout(
              largeScreen: Center(
                child: Column(
                  children: const [
                    NavBar(),
                    Expanded(child: ContentFrame()),
                    // Text("This is a large screen")
                  ],
                ),
              ),
              smallScreen: ResponsivePlatform(
                webScreen: Scaffold(
                  bottomNavigationBar: const NavBar(),
                  body: Column(
                    children: const [
                      ContentFrame(),
                      // Text(context.watch<FrameProvider>().navBarIndex.toString()),
                    ],
                  ),
                ),
              ));
        });
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  void _selectScreen(int index) {
    setState(() {
      _currentIndex = index;
      context.read<FrameProvider>().setIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        selectedIndex: _currentIndex,
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
  final List<Widget> _listOfScreens = [
    //List of Screens
    const TodolistScreen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return _listOfScreens[context
        .watch<FrameProvider>()
        .navBarIndex]; // return _listOfScreens[context.watch<FrameProvider>().navBarIndex];
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

