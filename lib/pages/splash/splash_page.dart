import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_e_commerce/pages/base/base_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  splashTimer() async {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Get.off(() => const BasePage());
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // splashTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Lottie.asset('asset/lottie/shoppingCartLoading.json'),
      ),
    );
  }
}
