import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final QueryDocumentSnapshot snapshot;
  const ProductDetailsPage({super.key, required this.snapshot});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    log(widget.snapshot['description']);
    return Container();
  }
}
