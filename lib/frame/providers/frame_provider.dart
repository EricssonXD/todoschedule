import 'package:flutter/cupertino.dart';

// import '../domain/index.dart';
export 'package:provider/provider.dart';

class FrameProvider with ChangeNotifier {
  int _screenIndex = 0;
  get navBarIndex => _screenIndex;

  void setIndex(int newIndex) {
    _screenIndex = newIndex;
    notifyListeners();
  }
}
