import 'package:get/get.dart';
import 'package:my_e_commerce/controller/auth_controller.dart';
import 'package:my_e_commerce/controller/splash_controller.dart';
import 'package:my_e_commerce/controller/theme_controller.dart';

class GetxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ThemeController());
    Get.lazyPut(() => SplashController());
  }
}
