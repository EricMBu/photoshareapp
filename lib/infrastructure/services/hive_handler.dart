import 'package:hive_flutter/hive_flutter.dart';
import 'package:photoshare/domain/models/gallery_image/gallery_image.dart';

const String kFoldersBoxName = '__K_GALLERY_FOLDERS_NAMES__';

class HiveHandler {
  static HiveHandler? _instance;

  static HiveHandler get instance => _instance ??= HiveHandler();

  late final Box<String> _folders;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(GalleryImageAdapter());

    _folders = await Hive.openBox<String>(kFoldersBoxName);
  }

  Future<List<String>> getGalleryFolders() async {
    return _folders.values.toList();
  }

  Future<void> createGalleryFolder(String folderName) async {
    if (await Hive.boxExists(folderName) || folderName == kFoldersBoxName) {
      throw Exception('Folder name already exists or is a protected name.');
    } else {
      _folders.add(folderName);
    }
  }

  Future<LazyBox<GalleryImage>> openGalleryFolder(String folderName) {
    return Hive.openLazyBox<GalleryImage>(folderName);
  }

  Future<void> addImageToBox(
    LazyBox<GalleryImage> box,
    GalleryImage img,
  ) async {
    await box.add(img);
  }
}
