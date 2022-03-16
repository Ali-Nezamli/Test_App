import 'package:validators/validators.dart';

emailValidate(String value) {
  if (!isEmail(value)) {
    return 'Enter valid email';
  }
}

passwordValidate(String value) {
  if (value.length < 8 || value.length > 8) {
    return 'Password must be at least 8 chars';
  }
}
