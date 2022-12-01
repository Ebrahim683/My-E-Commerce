import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce/constant/app_const.dart';

Widget button(Function()? onPressed, String? title, IconData? icon,
    double? height, double? width) {
  return InkWell(
    onTap: onPressed,
    child: Card(
      elevation: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Color.fromARGB(255, 252, 249, 249),
        ),
        height: height,
        width: width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
              ),
              SizedBox(height: 10.h),
              Text(title.toString())
            ],
          ),
        ),
      ),
    ),
  );
}
