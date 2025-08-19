import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tick_to_do/core/injection/injection_container.dart';

import '../../env.dart';

Future<void> initFirebasePlugin() async {
  await Firebase.initializeApp();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  GoogleSignIn googleSignIn = GoogleSignIn.instance;
  await googleSignIn.initialize(
    serverClientId: Env.googleSignInServerClientId,
  );
  sl.registerLazySingleton<GoogleSignIn>(() => googleSignIn);
  sl.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);
  sl.registerLazySingleton<FirebaseFirestore>(() => firestore);
}
