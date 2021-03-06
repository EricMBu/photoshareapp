import 'package:get/get.dart';
import 'package:photoshare/domain/models/credentials/credentials.dart';
import 'package:photoshare/infrastructure/services/firebase/auth.dart';
import 'package:photoshare/repositories/contracts/user_repository_contract.dart';

class UserRepository implements UserRepositoryContract {
  FirebaseAuthService get _authService => Get.find<FirebaseAuthService>();

  @override
  Future<bool> isLoggedIn() {
    final user = _authService.user;
    return Future.value(user != null);
  }

  @override
  Future<void> signOut() async {
    await _authService.signOut();
  }

  @override
  Future<void> anonymousSignIn() async {
    await _authService.signInAnonymously();
  }

  @override
  Future<String> getUserUid() {
    return Future.value(_authService.userUid);
  }

  @override
  Future<void> signUp(Credentials credentials) async {
    assert(
      credentials.isFilled(),
      'Credentials need to be filled for sign up.',
    );

    await _authService.signUpWithEmail(
      credentials.email!,
      credentials.password!,
    );
  }

  @override
  Future<void> signIn(Credentials credentials) async {
    assert(
      credentials.isFilled(),
      'Credentials need to be filled for sign in.',
    );

    await _authService.signInWithEmail(
      credentials.email!,
      credentials.password!,
    );
  }
}
