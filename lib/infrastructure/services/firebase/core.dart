import 'package:firebase_core/firebase_core.dart';

class FirebaseCoreService {
  const FirebaseCoreService();

  Future<FirebaseApp> init() => Firebase.initializeApp();

  FirebaseApp appInstance() => Firebase.app();
}
