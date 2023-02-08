import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_e_commerce/bindings/getx_binding.dart';
import 'package:my_e_commerce/constant/app_const.dart';
import 'package:my_e_commerce/pages/splash/splash_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      builder: (context, child) => GetMaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppConst.backgroundColor,
        ),
        themeMode: ThemeMode.system,
        initialBinding: GetxBinding(),
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
      designSize: const Size(360, 690),
    );
  }
}
