import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:my_e_commerce/constant/app_const.dart';
import 'package:my_e_commerce/firebasehelper/firebase_helper.dart';
import 'package:my_e_commerce/pages/auth/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        (() => LoadingOverlay(
              isLoading: FirebaseHelper.isLoading.value,
              child: Container(
                height: Get.height,
                width: Get.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xffFF8A78), Color(0xffFF4870)])),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 20.w),
                              child: Text('Login',
                                  style: AppConst.textStyle(Colors.white, 25.0,
                                      FontWeight.w300, 'DancingScript')),
                            )
                          ],
                        ),
                        Lottie.asset('asset/lottie/loginAnimation.json'),
                        //email stack
                        Stack(
                          children: [
                            Container(
                              width: 300.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 241, 82, 96),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: TextField(
                                controller: emailController,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: AppConst.textStyle(Colors.white),
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: 'Email address',
                                  hintStyle: AppConst.textStyle(Colors.white),
                                ),
                              ),
                            ),
                            Positioned(
                              child: CircleAvatar(
                                radius: 25.r,
                                backgroundColor: Colors.white,
                                child: const Center(
                                  child: Icon(
                                    Icons.email_outlined,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        //password stack
                        Stack(
                          children: [
                            Container(
                              width: 300.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 241, 82, 96),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: TextField(
                                controller: passwordController,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                obscureText: true,
                                style: AppConst.textStyle(Colors.white),
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: 'Password',
                                  hintStyle: AppConst.textStyle(Colors.white),
                                ),
                              ),
                            ),
                            Positioned(
                              child: CircleAvatar(
                                radius: 25.r,
                                backgroundColor: Colors.white,
                                child: const Center(
                                  child: Icon(
                                    PhosphorIcons.key,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 35.h),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          width: Get.width,
                          child: MaterialButton(
                              onPressed: () {
                                var email = emailController.text.trim();
                                var password = passwordController.text.trim();
                                if (email.isEmpty) {
                                  Get.snackbar('Error', 'Enter email adress');
                                } else if (password.isEmpty) {
                                  Get.snackbar('Errro', 'Enter password');
                                } else {
                                  setState(() {
                                    FirebaseHelper.isLoading.value = true;
                                  });
                                  FirebaseHelper.userLogin(email, password);
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset(Icons8.login,
                                      height: 20.h, width: 20.w),
                                  SizedBox(width: 10.w),
                                  Text(
                                    'LOGIN',
                                    style: AppConst.textStyle(Colors.black),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(height: 15.h),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot password?',
                            style: AppConst.textStyle(Colors.white),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account? ',
                              style: AppConst.textStyle(Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.off(() => const RegisterPage());
                              },
                              child: Text(
                                'Sign Up Now',
                                style: AppConst.textStyle(Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
