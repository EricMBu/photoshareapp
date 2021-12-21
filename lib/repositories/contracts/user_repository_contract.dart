import 'package:photoshare/domain/models/credentials/credentials.dart';

abstract class UserRepositoryContract {
  Future<bool> isLoggedIn();
  Future<void> signOut();
  Future<void> anonymousSignIn();
  Future<String> getUserUid();
  Future<void> signUp(Credentials credentials);
  Future<void> signIn(Credentials credentials);
}
