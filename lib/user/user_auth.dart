import 'dart:ffi';

class UserAuth {
  static String? token;
  static String? password;

  static bool isAuthorized() {
    if (token != null && password != null) {
      return true;
    } else {
      return false;
    }
  }
}
