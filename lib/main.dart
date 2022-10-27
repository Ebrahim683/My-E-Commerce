import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/pages/splash/splash_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
      designSize: const Size(360, 690),
    );
  }
}
