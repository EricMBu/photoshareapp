bool isValidPassword(String str) {
  final String specialChars =
      RegExp.escape(r'!#%&()*+,-./:;<=>?@[]^_`{|}~$\" ' r"'");
  final _password = RegExp('^[a-z0-9$specialChars]+\$', caseSensitive: false);

  return _password.hasMatch(str);
}
