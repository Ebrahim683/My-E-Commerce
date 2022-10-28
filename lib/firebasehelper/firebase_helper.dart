import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseHelper extends GetxController {
  static RxString uid = ''.obs;
  static RxString uidl = ''.obs;
  static var isLoading = false.obs;

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  //user registration
  static userRegister(String fullName, String email, String password) async {
    try {
      var credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      uid.value = credential.user!.uid;
      isLoading.value = false;
      log('auth: $uid');
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      log('auth: ${e.message}');
      Get.snackbar('Errro', '${e.message}');
    }
  }

  //user login
  static userLogin(String email, String password) async {
    try {
      var credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      uidl.value = credential.user!.uid;

      log('auth: $uidl');
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      log('auth: ${e.message}');
      Get.snackbar('Errro', '${e.message}');
    }
  }
}
