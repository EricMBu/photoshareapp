import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'gallery_image.g.dart';

@HiveType(typeId: 0)
class GalleryImage extends HiveObject {
  GalleryImage(
    this.rawBinary, {
    this.name,
    this.dateAdded,
  });

  @HiveField(0)
  final String? name;
  @HiveField(1)
  final Uint8List rawBinary;
  @HiveField(2)
  final DateTime? dateAdded;
}
