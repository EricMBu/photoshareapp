import 'package:firebase_auth/firebase_auth.dart';
import 'package:photoshare/infrastructure/exceptions/auth_exceptions.dart';

class FirebaseAuthService {
  const FirebaseAuthService();

  FirebaseAuth get _instance => FirebaseAuth.instance;

  User? get user => _instance.currentUser;

  String get userUid {
    if (user == null) {
      throw UserNotAuthenticatedException();
    }
    return user!.uid;
  }

  Future<void> signOut() {
    return _instance.signOut();
  }

  Future<UserCredential> signInAnonymously() {
    return _instance.signInAnonymously();
  }

  Future<UserCredential> signUpWithEmail(String email, String password) {
    return _instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signInWithEmail(String email, String password) {
    return _instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
