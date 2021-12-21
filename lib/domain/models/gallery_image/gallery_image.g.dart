// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GalleryImageAdapter extends TypeAdapter<GalleryImage> {
  @override
  final int typeId = 0;

  @override
  GalleryImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GalleryImage(
      fields[1] as Uint8List,
      name: fields[0] as String?,
      dateAdded: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, GalleryImage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.rawBinary)
      ..writeByte(2)
      ..write(obj.dateAdded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GalleryImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
