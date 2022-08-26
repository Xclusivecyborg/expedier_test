import 'package:expedier_test/core/utils/constants.dart';

class Validators {
  static final emailPattern = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
    r"[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}"
    r"[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}"
    r"[a-zA-Z0-9])?)+$",
  );

  static Validator notEmpty() {
    return (String? value) {
      return (value?.isEmpty ?? true) ? "This field can not be empty." : null;
    };
  }

  static Validator minLength(int minLength) {
    return (String? value) {
      if ((value?.length ?? 0) < minLength) {
        return "Must contain a minimum of $minLength characters.";
      }
      return null;
    };
  }

  static Validator matchPattern(Pattern pattern, [String? patternName]) {
    return (String? value) {
      if (value == null || (pattern.allMatches(value).isEmpty)) {
        return "Please enter a valid ${patternName ?? "value"}.";
      }
      return null;
    };
  }

  static Validator email() {
    return matchPattern(emailPattern, "email");
  }

  static Validator password([int minimumLength = 8]) => multiple(
        [
          containsUpper("Password"),
          containsLower("Password"),
          containsNumber("Password"),
          containsSpecialChar("Password"),
          minLength(minimumLength),
        ],
        shouldTrim: false,
      );

  static Validator containsUpper([String? fieldName]) {
    return (String? value) {
      if (value != null && value.containsUpper()) return null;
      return uppercase;
    };
  }

  static Validator containsLower([String? fieldName]) {
    return (String? value) {
      if (value != null && value.containsLower()) return null;
      return lowercase;
    };
  }

  static Validator containsNumber([String? fieldName]) {
    return (String? value) {
      if (value != null && value.containsNumber()) return null;
      return atleastnumber;
    };
  }

  static Validator containsSpecialChar([String? fieldName]) {
    return (String? value) {
      if (value != null && value.containsSpecialChar()) return null;
      return specialCharacter;
    };
  }

  static Validator multiple(
    List<Validator> validators, {
    bool shouldTrim = true,
  }) {
    return (String? value) {
      value = shouldTrim ? value?.trim() : value;
      for (Validator validator in validators) {
        if (validator(value) != null) {
          return validator(value);
        }
      }
      return null;
    };
  }
}

typedef Validator = String? Function(String? value);

extension CharacterValidation on String {
  bool containsUpper() {
    for (var i = 0; i < length; i++) {
      var code = codeUnitAt(i);
      if (code >= 65 && code <= 90) return true;
    }
    return false;
  }

  bool containsLower() {
    for (var i = 0; i < length; i++) {
      var code = codeUnitAt(i);
      if (code >= 97 && code <= 122) return true;
    }
    return false;
  }

  bool containsSpecialChar() {
    for (var i = 0; i < length; i++) {
      var char = this[i];
      if ("#?!@\$ %^&*-".contains(char)) return true;
    }
    return false;
  }

  bool containsNumber() {
    for (var i = 0; i < length; i++) {
      var code = codeUnitAt(i);
      if (code >= 48 && code <= 57) return true;
    }
    return false;
  }
}
