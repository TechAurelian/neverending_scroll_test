import 'package:shared_preferences/shared_preferences.dart';

/// Helper class that saves and reads app settings to persistent storage.
class SettingsProvider {
  /// Initial selected index
  static const int _initialSelectedItem = 0;

  /// Persistent storage keys.
  static const String _selectedItemKey = 'selected_item';

  /// Saves the currently selected item index that's closest to the center of the viewport
  /// to persistent storage.
  static Future<void> setSelectedItem(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_selectedItemKey, value);
  }

  /// Reads the currently selected item index that's closest to the center of the viewport
  /// from persistent storage.
  static Future<int> getSelectedItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_selectedItemKey) ?? _initialSelectedItem;
  }
}
