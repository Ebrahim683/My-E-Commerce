import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/constant/app_const.dart';
import 'package:my_e_commerce/widget/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  final images = [
    'bookshopping.jpeg',
    'featuredproductsbg.jpg',
    'gadgets.jpg',
    'gymshopping.png',
    'mendress.jpg',
    'wallet.png',
    'womendress.jpg',
  ];
  @override
  void initState() {
    super.initState();
    log('home page');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: TextField(
                  onChanged: (value) {
                    log(value);
                  },
                  controller: searchController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search anything...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                  ),
                ),
              ),
              //image slider
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
              //category
              SizedBox(
                height: 50.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        log(index.toString());
                      },
                      child: Container(
                        height: 30.h,
                        width: Get.width * 0.4,
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Center(
                          child: Text('Index:$index'),
                        ),
                      ),
                    );
                  },
                ),
              ),
              //popular items
              SizedBox(height: 10.h),
              StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                axisDirection: AxisDirection.down,
                children: List.generate(
                  images.length,
                  (index) => ItemWidget(
                    image: images[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
