import 'package:in_app_review/in_app_review.dart';
import 'package:tick_to_do/core/core.dart';

initInAppReviewPlugin() {
  InAppReview inAppReview = InAppReview.instance;
  sl.registerLazySingleton<InAppReview>(() => inAppReview);
}

Future requestReview() async {
  if (await sl<InAppReview>().isAvailable()) {
    await sl<InAppReview>().requestReview();
  }
}

Future openStoreListing() async {
  await sl<InAppReview>().openStoreListing();
}
