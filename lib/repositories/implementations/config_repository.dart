import 'package:get/get.dart';
import 'package:photoshare/infrastructure/services/firebase/core.dart';
import 'package:photoshare/repositories/contracts/config_repository_contract.dart';

class ConfigRepository implements ConfigRepositoryContract {
  @override
  Future<void> startServices() async {
    await Get.find<FirebaseCoreService>().init();
  }
}
