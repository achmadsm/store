String? passwordValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password.';
  } else if (value.length < 8) {
    return 'Password at least 8 characters.';
  }
  return null;
}
