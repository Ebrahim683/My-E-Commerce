import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce/widget/appWidget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log('category page');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('category').snapshots(),
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
                  return Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: categoryProducts(data),
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
    );
  }
}
