import 'package:get/get.dart';
import 'package:photoshare/infrastructure/services/firebase/auth.dart';
import 'package:photoshare/infrastructure/services/firebase/cloud_firestore.dart';
import 'package:photoshare/infrastructure/services/firebase/core.dart';
import 'package:photoshare/repositories/contracts/config_repository_contract.dart';
import 'package:photoshare/repositories/contracts/user_repository_contract.dart';
import 'package:photoshare/repositories/implementations/config_repository.dart';
import 'package:photoshare/repositories/implementations/user_repository.dart';

class AppBindings implements Bindings {
  const AppBindings();

  @override
  void dependencies() {
    // Repositories
    Get.lazyPut<ConfigRepositoryContract>(() => ConfigRepository(),
        fenix: true);
    Get.lazyPut<UserRepositoryContract>(() => UserRepository(), fenix: true);

    // Firebase Services
    Get.lazyPut(() => const FirebaseCoreService(), fenix: true);
    Get.lazyPut(() => const FirebaseAuthService(), fenix: true);
    Get.lazyPut(() => const CloudFirestoreService(), fenix: true);

    // DAO
  }
}
