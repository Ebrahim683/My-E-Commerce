import 'package:get/get.dart';
import 'package:my_e_commerce/pages/auth/login_page.dart';
import 'package:my_e_commerce/pages/base/base_page.dart';
import 'package:my_e_commerce/utils/get_storage_manager.dart';

class SplashController extends GetxController {
  static navigate() {
    Future.delayed(
      const Duration(milliseconds: 5500),
      () {
        GetStorageManager.isLoggedIn() == false
            ? Get.off(() => const LoginPage())
            : Get.off(() => const BasePage());
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    navigate();
  }
}
