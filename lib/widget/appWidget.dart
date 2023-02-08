import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/pages/category/sub_category_page.dart';
import 'package:my_e_commerce/pages/item/item_page.dart';
import 'package:my_e_commerce/pages/product_details/product_details_page.dart';


Widget bigButton(Function()? onPressed, String? title, IconData? icon,
    double? height, double? width) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20.r),
    child: InkWell(
      onTap: onPressed,
      child: Card(
        child: Container(
          color: const Color.fromARGB(255, 252, 249, 249),
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
    ),
  );
}

Widget featuredCategoryButton(Function()? onTap, String? image, double? height,
    double? width, String? title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: const Color.fromARGB(255, 252, 249, 249),
          height: height,
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Image.asset(
                  image!,
                  width: 80,
                  height: height,
                ),
              ),
              Text(
                title!,
                style: TextStyle(color: Colors.black, fontSize: 10.sp),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget featuredProducts(QueryDocumentSnapshot snapshot) {
  double height = Get.height * 0.3;
  double width = 150;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: InkWell(
        onTap: () {
          Get.to(ProductDetailsPage(snapshot: snapshot));
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.white,
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                snapshot['url'],
                width: width,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(snapshot['description'],
                    style: const TextStyle(color: Colors.black, fontSize: 10)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('\$ ${snapshot['price']}',
                    style: const TextStyle(color: Colors.black, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget allProducts(QueryDocumentSnapshot snapshot) {
  double height = Get.height;
  double width = Get.width;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: InkWell(
      onTap: () {
        Get.to(ProductDetailsPage(snapshot: snapshot));
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.white,
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              snapshot['url'],
              width: width,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(snapshot['description'],
                  style: TextStyle(color: Colors.black, fontSize: 20.sp)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('\$ ${snapshot['price']}',
                  style: const TextStyle(color: Colors.black, fontSize: 15)),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget categoryProducts(QueryDocumentSnapshot snapshot) {
  double height = Get.height;
  double width = Get.width;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: InkWell(
        onTap: () {
          Get.to(SubCategoryPage(snapshot: snapshot));
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.white,
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                snapshot['url'],
                // width: width,
                fit: BoxFit.cover,
              ),
              Text(snapshot['name'],
                  style: TextStyle(color: Colors.black, fontSize: 10.sp)),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget singleCategoryList(QueryDocumentSnapshot snapshot) {
  double height = Get.height;
  double width = Get.width;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: InkWell(
        onTap: () {
          Get.to(ItemPage(snapshot: snapshot));
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.white,
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                snapshot['url'],
                // width: width,
                fit: BoxFit.cover,
              ),
              Text(snapshot['name'],
                  style: TextStyle(color: Colors.black, fontSize: 10.sp)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("\$ ${snapshot['price']}",
                    style: TextStyle(color: Colors.black, fontSize: 15.sp)),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget filterCategory(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: InkWell(
        onTap: () {
          log(title);
        },
        child: Container(
          height: 50,
          width: 100,
          color: Colors.white,
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    ),
  );
}


