import 'package:testapp/Data/Services/services.dart';

class Repository {
  static signIn(String userEmail, String userPassword) async {
    int? value = await HttpServices.signIn(userEmail, userPassword);
    return value;
  }
}
