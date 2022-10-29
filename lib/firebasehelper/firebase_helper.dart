import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/pages/auth/login_page.dart';
import 'package:my_e_commerce/pages/base/base_page.dart';
import 'package:my_e_commerce/utils/get_storage_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      Get.off(() => const LoginPage());
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
      isLoading.value = false;
      log('auth: $uidl');
      GetStorageManager.saveToken(uidl.toString());
      Get.off(() => const BasePage());
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      log('auth: ${e.message}');
      Get.snackbar('Errro', '${e.message}');
    }
  }

  //google sign in
  static googleSignin() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication?.accessToken,
          idToken: googleSignInAuthentication?.idToken);
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      GetStorageManager.saveToken(userCredential.user?.uid.toString());
      isLoading.value = false;
      log('google auth: ${userCredential.user?.uid}');
    } catch (e) {
      isLoading.value = false;
      log('google auth: $e');
      Get.snackbar('Errro', '$e');
    }
  }
}
