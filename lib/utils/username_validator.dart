String? usernameValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your username.';
  }
  return null;
}
