import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;

enum _PlatformType {
  // ignore_for_file: constant_identifier_names
  Web,
  WebMobile,
  Android,
  IOS,
  Windows,
  MacOS,
  Linux,
  Fuchsia,
  NOTFOUND,
}

class ResponsiveLayout extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveLayout(
      {super.key,
      required this.largeScreen,
      this.mediumScreen,
      this.smallScreen});

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return largeScreen;
        } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 800) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}

class _PlatformDetector {
  _PlatformType _platformName = _PlatformType.NOTFOUND;
  _PlatformType get platform => _platformName;
  final _isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  _PlatformDetector() {
    // ignore: avoid_print
    print("Checking Platform");
    if (_isWebMobile) {
      _platformName = _PlatformType.WebMobile;
    } else if (kIsWeb) {
      _platformName = _PlatformType.Web;
    } else {
      if (Platform.isAndroid) {
        _platformName = _PlatformType.Android;
      } else if (Platform.isIOS) {
        _platformName = _PlatformType.IOS;
      } else if (Platform.isFuchsia) {
        _platformName = _PlatformType.Fuchsia;
      } else if (Platform.isLinux) {
        _platformName = _PlatformType.Linux;
      } else if (Platform.isMacOS) {
        _platformName = _PlatformType.MacOS;
      } else if (Platform.isWindows) {
        _platformName = _PlatformType.Windows;
      } else {
        // print("Ummm Huh??? Cannot Find Platform");
      }
    }
  }
}

_PlatformDetector _thisPlatform = _PlatformDetector();

class ResponsivePlatform extends StatelessWidget {
  final Widget webScreen;
  final Widget? webMobileScreen;
  final Widget? androidScreen;
  final Widget? iosScreen;
  final Widget? windowsScreen;
  final Widget? macosScreen;
  final Widget? linuxScreen;
  final Widget? fuchsiaScreen;

  const ResponsivePlatform({
    super.key,
    required this.webScreen,
    this.webMobileScreen,
    this.androidScreen,
    this.iosScreen,
    this.windowsScreen,
    this.macosScreen,
    this.linuxScreen,
    this.fuchsiaScreen,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        List<Widget?> list = [
          webScreen,
          webMobileScreen,
          androidScreen,
          iosScreen,
          windowsScreen,
          macosScreen,
          linuxScreen,
          fuchsiaScreen
        ];
        return list[_thisPlatform.platform.index] ?? webScreen;
      },
    );
  }
}
