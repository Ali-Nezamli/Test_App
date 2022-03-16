import 'package:testapp/Data/Services/services.dart';

class Repository {
  signIn(String userEmail, String userPassword) async {
    int? value = await HttpServices.signIn(userEmail, userPassword);
    return value;
  }
}
