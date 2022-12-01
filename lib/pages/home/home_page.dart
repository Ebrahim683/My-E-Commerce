import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/widget/appWidget.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search anything...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            //image slider 1
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('slider').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData && snapshot.data != null) {
                  return VxSwiper.builder(
                    reverse: false,
                    height: 135.h,
                    itemCount: snapshot.data!.docs.length,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    enlargeCenterPage: true,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index];
                      return InkWell(
                        onTap: () {
                          log(data['title']);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5.0),
                          width: Get.width,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(data['url']),
                                fit: BoxFit.fill,
                              ),
                            ),
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                data['title'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(
                                  const EdgeInsets.symmetric(horizontal: 10))
                              .make(),
                        ),
                      );
                    },
                  );
                } else {
                  log(snapshot.error.toString());
                  return Center(child: Text(snapshot.error.toString()));
                }
              },
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                button(() {}, 'Todays deal', Icons.list, Get.height * 0.15,
                    Get.width / 2.5),
                button(() {}, 'Flash sell', PhosphorIcons.lightning,
                    Get.height * 0.15, Get.width / 2.5),
              ],
            ),
            SizedBox(height: 10.h),
            //image slider2
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('slider').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData && snapshot.data != null) {
                  return VxSwiper.builder(
                    reverse: false,
                    height: 135.h,
                    itemCount: snapshot.data!.docs.length,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    enlargeCenterPage: true,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index];
                      return InkWell(
                        onTap: () {
                          log(data['title']);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5.0),
                          width: Get.width,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(data['url']),
                                fit: BoxFit.fill,
                              ),
                            ),
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                data['title'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(
                                  const EdgeInsets.symmetric(horizontal: 10))
                              .make(),
                        ),
                      );
                    },
                  );
                } else {
                  log(snapshot.error.toString());
                  return Center(child: Text(snapshot.error.toString()));
                }
              },
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(() {}, 'Top Category', Icons.category, Get.height * 0.15,
                    Get.width * 0.3),
                button(() {}, 'Brands', PhosphorIcons.lightbulb,
                    Get.height * 0.15, Get.width * 0.3),
                button(() {}, 'Too Sellers', PhosphorIcons.crown,
                    Get.height * 0.15, Get.width * 0.3),
              ],
            ),
            SizedBox(height: 5.h),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Featured Categories',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
