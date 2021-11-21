class EmptyValueException implements Exception {
  const EmptyValueException();
}

class InvalidLengthException implements Exception {
  final int offendingLength;
  final int? lowerBound;
  final int? upperBound;

  const InvalidLengthException(
    this.offendingLength, {
    this.lowerBound,
    this.upperBound,
  });

  const InvalidLengthException.fixedLength(
    this.offendingLength, {
    int? fixedLength,
  })  : lowerBound = fixedLength,
        upperBound = fixedLength;
}

class InvalidCharacterException implements Exception {
  final String? offendingChar;

  const InvalidCharacterException([this.offendingChar]);
}

class InvalidNumberException<T extends num> implements Exception {
  final T? lowerBound;
  final T? upperBound;

  const InvalidNumberException({
    this.lowerBound,
    this.upperBound,
  });
}

class InvalidMonetaryValueException implements Exception {
  final double value;

  const InvalidMonetaryValueException(this.value);
}

class EmailFormatException implements Exception {
  const EmailFormatException();
}
