import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_e_commerce/pages/auth/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  splashTimer() async {
    Future.delayed(
      const Duration(milliseconds: 5500),
      () {
        Get.off(() => const LoginPage());
      },
    );
  }

  @override
  void initState() {
    super.initState();
    splashTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffFFB75E), Color(0xffED8F03)])),
        child: Center(
          child: Lottie.asset('asset/lottie/shoppingCartLoading.json'),
        ),
      ),
    );
  }
}
