import 'package:flutter/foundation.dart';

abstract class ValueObject<T> {
  final T _value;

  T get value => _value;

  ValueObject(this._value) {
    validator();
  }

  @protected
  void validator();

  @override
  String toString() {
    return value.toString();
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(Object other) {
    return other is ValueObject<T> && _value == other.value;
  }
}
