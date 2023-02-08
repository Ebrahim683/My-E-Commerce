import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemPage extends StatefulWidget {
  final QueryDocumentSnapshot snapshot;
  const ItemPage({super.key, required this.snapshot});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  bool isLiked = false;
  int count = 1;
  int price = 500;
  int? totalPrice;
  @override
  Widget build(BuildContext context) {
    // price = int.parse(widget.snapshot['price']);
    totalPrice = price;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.snapshot['name'],
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
              icon: Icon(
                isLiked == false
                    ? PhosphorIcons.heart_light
                    : PhosphorIcons.heart_fill,
                color: Colors.black,
              )),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //image
              Align(
                alignment: Alignment.topCenter,
                child: Image.network(
                  widget.snapshot['url'],
                  height: Get.height * 0.6,
                  width: Get.width * 0.6,
                ),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.snapshot['name'],
                  style: TextStyle(color: Colors.black, fontSize: 15.sp),
                ),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "\$ ${widget.snapshot['price']}",
                  style: TextStyle(color: Colors.black, fontSize: 15.sp),
                ),
              ),
              SizedBox(height: 10.h),
              //rating bar
              Align(
                alignment: Alignment.centerLeft,
                child: VxRating(
                  onRatingUpdate: (value) {},
                  normalColor: Colors.grey,
                  selectionColor: const Color.fromRGBO(255, 215, 0, 1),
                  count: 5,
                  size: 25,
                  stepInt: true,
                ),
              ),
              // SizedBox(height: 10.h),
              // //count
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     IconButton(
              //         onPressed: () {
              //           setState(() {
              //             if (count > 1) {
              //               count--;
              //             }
              //           });
              //         },
              //         icon: Container(
              //           color: Colors.black,
              //           height: 3,
              //           width: 15,
              //         )),
              //     Container(
              //       height: 20,
              //       width: 20,
              //       child: Text(count.toString()),
              //     ),
              //     IconButton(
              //         onPressed: () {
              //           setState(() {
              //             count++;
              //           });
              //         },
              //         icon: const Icon(
              //           Icons.add,
              //           color: Colors.black,
              //         )),
              //   ],
              // ),
              // SizedBox(height: 10.h),
              // //total price
              // Text(
              //   "Total: \$ $totalPrice",
              //   style: TextStyle(color: Colors.black, fontSize: 15.sp),
              // ),
              SizedBox(height: 10.h),
              //cart button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: SizedBox(
                      height: 50.h,
                      width: Get.width * 0.4,
                      child: MaterialButton(
                        color: Colors.redAccent,
                        onPressed: () {},
                        child: Text(
                          'Add to cart',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: SizedBox(
                      height: 50.h,
                      width: Get.width * 0.4,
                      child: MaterialButton(
                        color: Colors.orange,
                        onPressed: () {},
                        child: Text(
                          'Buy now',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
