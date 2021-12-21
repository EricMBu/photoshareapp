import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photoshare/application/controllers/mixins/loading_controller.dart';
import 'package:photoshare/domain/models/gallery_image/gallery_image.dart';
import 'package:photoshare/infrastructure/services/hive_handler.dart';

class FolderController extends GetxController with LoadingController {
  FolderController(this.folderName);

  final String folderName;
  late final LazyBox<GalleryImage> imgBox;

  final ImagePicker _picker = ImagePicker();

  final RxList<GalleryImage> images = RxList<GalleryImage>();

  @override
  void onInit() {
    HiveHandler.instance
        .openGalleryFolder(folderName)
        .then((value) => imgBox = value)
        .then((box) async {
      for (final key in box.keys) {
        final element = await box.get(key);
        if (element != null) {
          images.add(element);
        }
      }
    });
    super.onInit();
  }

  Future<void> selectImage() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (photo != null) {
      final bytes = await photo.readAsBytes();
      await HiveHandler.instance.addImageToBox(
        imgBox,
        GalleryImage(bytes),
      );
      images.add(GalleryImage(bytes));
    }
  }
}
