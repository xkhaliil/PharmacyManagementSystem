
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static const selectedId = "id";

  static Future<String> getSelectedId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(selectedId) ?? "";
  }

  static Future<bool> putSelectedId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(selectedId, id);
  }
}
