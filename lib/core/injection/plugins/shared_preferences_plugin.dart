import 'package:shared_preferences/shared_preferences.dart';
import 'package:tick_to_do/core/injection/injection_container.dart';

initSharedPreferencesPlugin() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);
}

const String onboardSeenKey = "onboardSeenKey";
const String themeModeKey = "themeModeKey";
const String hideTipKey = "hideTipKey";
const String requestRateKey = "requestRateKey";
