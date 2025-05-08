import 'package:shared_preferences/shared_preferences.dart';

class CompletionLosHelper {
  static const String _key = 'completed_los';

  static Future<void> markLoAsCompleted(int loId) async {
    final prefs = await SharedPreferences.getInstance();
    final completedIds = prefs.getStringList(_key) ?? [];
    if (!completedIds.contains(loId.toString())) {
      completedIds.add(loId.toString());
      await prefs.setStringList(_key, completedIds);
    }
  }

  static Future<bool> isLoCompleted(int loId) async {
    final prefs = await SharedPreferences.getInstance();
    final completedIds = prefs.getStringList(_key) ?? [];
    return completedIds.contains(loId.toString());
  }
}
