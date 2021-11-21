import 'value_objects/email.dart';
import 'value_objects/password.dart';

class Credentials {
  Credentials({this.email, this.password});

  Email? email;
  Password? password;
}
