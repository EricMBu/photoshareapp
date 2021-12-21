import 'package:get/get.dart';
import 'package:photoshare/application/controllers/mixins/loading_controller.dart';
import 'package:photoshare/infrastructure/services/hive_handler.dart';

class HomeController extends GetxController with LoadingController {
  // final ImagePicker _picker = ImagePicker();
  //
  // final List<Uint8List> _imageFileList = [];
  //
  // Future getImage() async {
  //   final XFile? photo = await _picker.pickImage(
  //     source: ImageSource.gallery,
  //     imageQuality: 50,
  //   );
  //   if (photo != null) {
  //     final bytes = await photo.readAsBytes();
  //     setState(() {
  //       _imageFileList.add(bytes);
  //     });
  //   }
  // }

  @override
  void onInit() {
    _loadGalleryFolders();
    super.onInit();
  }

  final RxList galleryFolders = <String>[].obs;

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
}
