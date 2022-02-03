import 'package:ecom_app/screens/Food/food_detail.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecom',
      debugShowCheckedModeBanner: false,
      home: PopularFoodDetailScreen(),
    );
  }
}
