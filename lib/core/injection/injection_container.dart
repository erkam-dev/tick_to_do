import 'package:get_it/get_it.dart';

import '../core.dart';

var sl = GetIt.instance;

Future<void> init() async {
  // plugins
  await initFirebasePlugin();
  await initSharedPreferencesPlugin();
  initInAppReviewPlugin();

  // features
  initTodoFeatures();
  initAuthFeatures();
}
