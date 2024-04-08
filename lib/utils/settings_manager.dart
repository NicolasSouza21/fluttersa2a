import 'package:shared_preferences/shared_preferences.dart';

class SettingsManager {
  static const _keyTheme = 'theme';
  static const _keyFontSize = 'font_size';

  static Future<void> saveValue(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    }
    // Adicione mais verificações de tipo conforme necessário para outros tipos de dados
  }

  static Future<dynamic> getValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  Future<void> saveTheme(String theme) async {
    await saveValue(_keyTheme, theme);
  }

  Future<String?> getTheme() async {
    return await getValue(_keyTheme);
  }

  Future<void> saveFontSize(double fontSize) async {
    await saveValue(_keyFontSize, fontSize);
  }

  Future<double?> getFontSize() async {
    return await getValue(_keyFontSize);
  }
}
