import 'package:get/get.dart';
import 'package:photoshare/application/controllers/mixins/loading_controller.dart';
import 'package:photoshare/infrastructure/services/hive_handler.dart';
import 'package:photoshare/presentation/views/folder_view/folder_view.dart';

class HomeController extends GetxController with LoadingController {
  @override
  void onInit() {
    _loadGalleryFolders();
    super.onInit();
  }

  final RxList galleryFolders = RxList<String>();

  Future<void> _loadGalleryFolders() async {
    final folderNames = await HiveHandler.instance.getGalleryFolders();
    galleryFolders
      ..clear()
      ..addAll(folderNames);
    setLoading(false);
  }

  Future<void> createFolder(String folderName) async {
    setLoading(true);
    await HiveHandler.instance.createGalleryFolder(folderName);
    await _loadGalleryFolders();
  }

  void navigateToFolder(String folderName) {
    Get.to(
      () => FolderPage(folderName: folderName),
      routeName: '/folder/$folderName',
    );
  }
}
