class Credentials {
  Credentials({this.email, this.password});

  String? email;
  String? password;

  bool isFilled() {
    return email != null && password != null;
  }
}
