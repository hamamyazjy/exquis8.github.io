import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleDatabase extends GetxService {
  static final LocaleDatabase _singleton = LocaleDatabase._internal();
  factory LocaleDatabase() {
    return _singleton;
  }
  LocaleDatabase._internal();

  SharedPreferences? sharedPreferences;

  Future<SharedPreferences> initSharedPrefrences() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences!;
    } else {
      return sharedPreferences!;
    }
  }

  setData(String key, String value) async {
    await sharedPreferences!.setString(key, value);
  }

  String? getData(String key) {
    String? x = sharedPreferences!.getString(key);

    return x;
  }
}
