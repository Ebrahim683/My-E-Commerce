import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_e_commerce/controller/theme_controller.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  // ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My-Commerce'),
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu)),
        ),
        // actions: [
        //   GetBuilder<ThemeController>(
        //     builder: (controller) => Switch(
        //         value: controller.isDark,
        //         onChanged: (state) {
        //           controller.changeTheme(state);
        //           log('$state');
        //         }),
        //   ),
        // ],
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Text('sdjfhdjk'),
        ),
      ),
      drawer: _drawer(),
    );
  }

  Widget _drawer() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.r), bottomRight: Radius.circular(50.r)),
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
                width: Get.size.width,
              ),
              SizedBox(height: 5.h),
              const Divider(color: Colors.grey),
              SizedBox(height: 5.h),
              ListTile(
                onTap: () {},
                leading: Lottie.asset(Icons8.home),
                title: const Text('Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
