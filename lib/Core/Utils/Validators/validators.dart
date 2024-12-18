class AppValidators {
  // Email Validator
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email cannot be empty';
    }

    // Regex for a valid email format
    const emailPattern =
        r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    final regex = RegExp(emailPattern);

    if (!regex.hasMatch(value)) {
      return 'Invaild Email';
    }

    return null; // Email is valid
  }

  // Password Validator
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password cannot be empty';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (value.length > 50) {
      return 'Incorrect Password';
    }

    return null; // Password is valid
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "You cannot leave the input field empty.";
    }

    /*  if (value.length < 10) {
      return 'Password must be at least 6 characters long';
    }
    if (value.length > 10) {
      return 'Incorrect Password';
    } */

    return null; // Password is valid
  }

  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "You cannot leave the input field empty.";
    }

    /*  if (value.length < 10) {
      return 'Password must be at least 6 characters long';
    }
    if (value.length > 10) {
      return 'Incorrect Password';
    } */

    return null; // Password is valid
  }
}
