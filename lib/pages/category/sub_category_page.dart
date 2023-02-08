import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/widget/appWidget.dart';

class SubCategoryPage extends StatefulWidget {
  final QueryDocumentSnapshot snapshot;
  const SubCategoryPage({super.key, required this.snapshot});

  @override
  State<SubCategoryPage> createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log('sub category page');
  }

  @override
  Widget build(BuildContext context) {
    log(widget.snapshot['name']);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_sharp),
        ),
        title: Text(
          widget.snapshot['name'],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            height: Get.height * 0.2,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/images/featuredproductsbg.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(5, (index) {
                    switch (index) {
                      case 0:
                        return filterCategory('Samsung');
                      case 1:
                        return filterCategory('Iphone');
                      case 2:
                        return filterCategory('OnePlus');
                      case 3:
                        return filterCategory('Google');
                      case 4:
                        return filterCategory('Vivo');
                      case 5:
                        return filterCategory('Xaomi');
                      default:
                        return filterCategory('More...');
                    }
                  }),
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(widget.snapshot['name'])
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.w,
                        mainAxisSpacing: 8.h,
                        mainAxisExtent: 300),
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index];
                      log(data['name'].toString());
                      log(data['price'].toString());
                      return Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: singleCategoryList(data),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
