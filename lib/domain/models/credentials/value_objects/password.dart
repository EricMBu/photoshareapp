import 'package:photoshare/domain/contracts/value_object.dart';
import 'package:photoshare/domain/exceptions/value_object_exceptions.dart';

const int _passwordLowerBoundRange = 6;
const int _passwordUpperBoundRange = 25;

class Password extends ValueObject<String> {
  static const minLength = _passwordLowerBoundRange;
  static const maxLength = _passwordUpperBoundRange;

  Password(String value) : super(value);

  @override
  void validator() {
    if (value.isEmpty) {
      throw const EmptyValueException();
    }

    if (value.length < _passwordLowerBoundRange ||
        value.length > _passwordUpperBoundRange) {
      throw InvalidLengthException(
        value.length,
        lowerBound: _passwordLowerBoundRange,
        upperBound: _passwordUpperBoundRange,
      );
    }
  }
}
