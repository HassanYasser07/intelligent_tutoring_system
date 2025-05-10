import 'package:shared_preferences/shared_preferences.dart';

class SavedAllTopics {
  static const String _key = 'saved_strings_list';

  Future<void> saveStringList(List<String> strings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, strings);
  }

  Future<List<String>> getStringList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }


  Future<void> addString(String newString) async {
    final prefs = await SharedPreferences.getInstance();
    final currentList = prefs.getStringList(_key) ?? [];

    if (!currentList.contains(newString)) {
      currentList.add(newString);
      await prefs.setStringList(_key, currentList);
    }
  }



  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }

  Future<void> removeString(String stringToRemove) async {
    final prefs = await SharedPreferences.getInstance();
    final currentList = prefs.getStringList(_key) ?? [];
    currentList.remove(stringToRemove);
    await prefs.setStringList(_key, currentList);
  }
}
