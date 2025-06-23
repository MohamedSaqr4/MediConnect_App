class Validators {
  static String? emailOrPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email or phone number';
    }
    // If contains letters, must be an email
    if (value.contains(RegExp(r'[a-zA-Z]')) && !value.contains('@')) {
      return 'Invalid email: must contain @';
    }
    // If only digits, must be a phone number
    if (RegExp(r'^\d{10,}\$').hasMatch(value) || value.contains('@')) {
      return null;
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? username(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (value.length < 10) {
      return 'Phone number must be at least 10 digits';
    }
    return null;
  }

  static String? address(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }
    return null;
  }

  static String? userType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select your user type';
    }
    return null;
  }
}
