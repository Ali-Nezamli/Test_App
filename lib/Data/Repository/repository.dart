import 'package:google_sign_in/google_sign_in.dart';
import 'package:testapp/Data/Services/services.dart';

class Repository {
  static Future<int?> signIn(String userEmail, String userPassword) async {
    int? value = await HttpServices.signIn(userEmail, userPassword);
    return value;
  }

  static Future<GoogleSignInAccount?> googleSignIn() async {
    GoogleSignInAccount? data = await HttpServices.googleSignIn();
    return data;
  }
}
