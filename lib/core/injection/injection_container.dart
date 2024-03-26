import 'package:get_it/get_it.dart';

import '../core.dart';

var sl = GetIt.instance;

init() async {
  // plugins
  await initFirebasePlugin();
  await initSharedPreferencesPlugin();
  await initInAppReviewPlugin();

  // features
  initTodoFeatures();
  initAuthFeatures();
}
