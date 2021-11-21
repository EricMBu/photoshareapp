import 'package:photoshare/domain/contracts/value_object.dart';
import 'package:photoshare/domain/exceptions/value_object_exceptions.dart';
import 'package:string_validator/string_validator.dart';

class Email extends ValueObject<String> {
  Email(String value) : super(value);

  @override
  void validator() {
    if (value.isEmpty) {
      throw const EmptyValueException();
    }

    if (!isEmail(value)) {
      throw const EmailFormatException();
    }
  }
}
