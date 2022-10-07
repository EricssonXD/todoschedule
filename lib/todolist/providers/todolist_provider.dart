import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/index.dart';
export 'package:provider/provider.dart';

class TodolistProvider with ChangeNotifier {
  final String _key = "todoList";
  List<TodolistModel> _todolist = [];
  late SharedPreferences _pref;

  get todoList => _todolist;

  TodolistProvider() {
    print("init shit");
    _loadFromPrefs();
  }

  _initPrefs() async {
    _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    List<String>? listString = _pref.getStringList(_key);
    if (listString != null) {
      _todolist =
          listString.map((item) => TodolistModel.fromJson(item)).toList();
    }
    print(_todolist[0].toString());
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    List<String> stringList = _todolist.map((item) => item.toJson()).toList();
    _pref.setStringList(_key, stringList);
  }

  addTodo({task}) {
    _todolist.insert(0, TodolistModel(task: task));
    print(_todolist.length);
    _saveToPrefs();
  }
  // Future<void> fetchData({required String n}) async {
  //   final _data = List.generate(3, ((index) => index + 1));
  //   data = _data;
  // }
}
