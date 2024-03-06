import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tick_to_do/core/injection/injection_container.dart';

initFirebasePlugin() async {
  await Firebase.initializeApp();
  var firebaseAuth = FirebaseAuth.instance;
  var firestore = FirebaseFirestore.instance;
  sl.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);
  sl.registerLazySingleton<FirebaseFirestore>(() => firestore);
}
