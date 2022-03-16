import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HttpServices {
  static String baseUrl = "https://speedprint.hashtagweb.online/api/";

  static Future<int?> signIn(
    String userEmail,
    String userPassword,
  ) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('Connected to internet');
        var url = Uri.parse('${baseUrl}user/login');
        var response = await http.post(url, body: {
          'email': userEmail,
          'password': userPassword,
        }).timeout(const Duration(seconds: 30));
        print(response.statusCode);
        switch (response.statusCode) {
          case 201:
            var token = convert.jsonDecode(response.body)['token'];
            print(token);
            return 201;
          case 401:
            return 401;

          default:
            print('Problem ${response.statusCode}');
            return null;
        }
      }
    } on SocketException catch (e) {
      print(e);
      rethrow;
    }
  }
}
