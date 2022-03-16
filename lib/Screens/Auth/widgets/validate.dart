requiredField(String value) {
  if (value.isEmpty) {
    return 'Required field';
  }
}

passwordValidate(String value) {
  if (value.length < 8 || value.length > 8) {
    return 'Password must be at least 8 chars';
  }
}
