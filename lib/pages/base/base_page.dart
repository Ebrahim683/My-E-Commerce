import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_e_commerce/constant/app_const.dart';
import 'package:my_e_commerce/controller/theme_controller.dart';
import 'package:my_e_commerce/pages/auth/login_page.dart';
import 'package:my_e_commerce/pages/cart/cart_page.dart';
import 'package:my_e_commerce/pages/category/category_page.dart';
import 'package:my_e_commerce/pages/home/home_page.dart';
import 'package:my_e_commerce/pages/profile/profile_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  // ThemeController themeController = Get.find();
  final pages = [
    const HomePage(),
    const CategoryPage(),
    const CartPage(),
    const ProfilePage()
  ];
  var selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.appBarColor,
        title: const Text('My-Commerce'),
      ),
      body: pages[selectedPage],
      bottomNavigationBar: bottomNav(),
    );
  }

  Widget bottomNav() {
    return SalomonBottomBar(
      items: [
        SalomonBottomBarItem(
            icon: const Icon(PhosphorIcons.house), title: const Text('Home')),
        SalomonBottomBarItem(
            icon: const Icon(PhosphorIcons.archive_box),
            title: const Text('Category')),
        SalomonBottomBarItem(
            icon: const Icon(PhosphorIcons.shopping_cart),
            title: const Text('Cart')),
        SalomonBottomBarItem(
            icon: const Icon(PhosphorIcons.person),
            title: const Text("Profile")),
      ],
      currentIndex: selectedPage,
      onTap: (value) {
        setState(() {
          selectedPage = value;
        });
      },
      selectedItemColor: AppConst.bottomNavSelectedIconColor,
      unselectedItemColor: AppConst.bottomNavIconColor,
    );
  }
}
