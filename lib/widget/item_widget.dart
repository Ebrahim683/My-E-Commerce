import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemWidget extends StatefulWidget {
  final String image;
  const ItemWidget({super.key, required this.image});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 10,
        color: const Color.fromARGB(255, 222, 231, 168),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              'asset/images/${widget.image}',
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10.h),
            const Align(
                alignment: Alignment.centerLeft, child: Text('Product Title')),
            const Align(
                alignment: Alignment.centerLeft, child: Text('Price: 20\$')),
          ],
        ),
      ),
    );
  }
}
