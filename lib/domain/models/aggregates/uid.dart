import 'package:json_annotation/json_annotation.dart';
import 'package:photoshare/domain/contracts/value_object.dart';
import 'package:photoshare/domain/exceptions/value_object_exceptions.dart';
import 'package:uuid/uuid.dart';

class Uid extends ValueObject<String> {
  Uid(String value) : super(value);

  factory Uid.generate() => Uid(const Uuid().v4());

  @override
  void validator() {
    if (value.isEmpty) {
      throw const EmptyValueException();
    }
  }
}

class UidConverter implements JsonConverter<Uid, String> {
  const UidConverter();

  @override
  Uid fromJson(String json) => Uid(json);

  @override
  String toJson(Uid object) => object.value;
}
