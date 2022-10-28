import 'package:get/get.dart';
import 'package:my_e_commerce/controller/auth_controller.dart';

class GetxBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => AuthController());
  }
}
