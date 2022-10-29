import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        actions: [
          GetBuilder<ThemeController>(
            builder: (controller) => Switch(
                value: controller.isDark,
                onChanged: (state) {
                  controller.changeTheme(state);
                  log('$state');
                }),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Text('sdjfhdjk'),
          ),
        ),
      ),
    );
  }
}
