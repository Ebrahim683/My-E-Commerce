import 'package:get_storage/get_storage.dart';

class GetStorageManager {
  static final box = GetStorage();

  static saveToken(token) {
    box.write('token', token);
  }

  static String getToken() {
    var token = box.read('token');
    return token;
  }

  static bool isLoggedIn() {
    var token = box.read('token');
    return token == null ? false : true;
  }
}
