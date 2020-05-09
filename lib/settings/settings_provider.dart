import 'package:shared_preferences/shared_preferences.dart';

/// Helper class that saves and reads app settings to persistent storage.
class SettingsProvider {

  /// Default scroll offset
  static const double _defaultScrollOffset = 0.0;

  /// Persistent storage keys.
  static const String _scrollOffsetKey = 'scroll_offset';

  /// Saves the scroll offset [value] to persistent storage.
  static Future<void> setScrollOffset(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_scrollOffsetKey, value);
  }

  /// Reads the scroll offset setting value from persistent storage.
  static Future<double> getScrollOffset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_scrollOffsetKey) ?? _defaultScrollOffset;
  }

}