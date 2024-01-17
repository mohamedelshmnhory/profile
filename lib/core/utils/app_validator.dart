class AppValidator {
  static const String requiredFieldMessage = 'This field is required';
  static const String invalidPasswordConfirmation = 'Passwords do not match';
  static const String invalidPasswordLength = 'Password must be between 6 and 16 characters';
  static const String invalidEmail = 'Invalid email address';
  static const String invalidPhoneNumber = 'Invalid phone number';
  static const String invalidPhoneNumberLength = 'Phone number must be between 9 and 15 digits';

  String? validatorRequired(value, {String? message}) {
    if (value == null || value.isEmpty) {
      return message ?? requiredFieldMessage;
    }
    return null;
  }

  String? validatorPassword(String? password, {String? confirmPassword}) {
    if (validatorRequired(password) != null) {
      return validatorRequired(password);
    }

    if (confirmPassword != null && password != confirmPassword) {
      return invalidPasswordConfirmation;
    }

    if (password!.length < 6 || password.length > 16) {
      return invalidPasswordLength;
    }

    return null;
  }

  String? validatorEmail(String? value) {
    if (validatorRequired(value) != null) {
      return validatorRequired(value);
    }

    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);

    if (!emailValid) {
      return invalidEmail;
    }

    return null;
  }

  String? validateMobile(String? value, String? dialNumber) {
    if (value != null && dialNumber != null && value.isNotEmpty) {
      String number = dialNumber + value;
      if (number.length >= 9 && number.length <= 15) {
        return null;
      } else {
        return invalidPhoneNumberLength;
      }
    } else {
      return invalidPhoneNumber;
    }
  }

  String? validateCountryCode(String? value, String? dialNumber) {
    if (value != null && dialNumber != null && value.isNotEmpty) {
      String number = dialNumber + value;
      return (number.length >= 9 && number.length <= 15) ? null : invalidPhoneNumberLength;
    } else {
      return invalidPhoneNumber;
    }
  }
}
