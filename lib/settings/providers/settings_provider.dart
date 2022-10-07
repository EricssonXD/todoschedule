// import '../domain/index.dart';

class SettingsProvider {
  List<int?> data = [];

  Future<void> fetchData({required String n}) async {
    final data = List.generate(3, ((index) => index + 1));
    data;
  }
}
