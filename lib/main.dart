import 'package:ecom_app/controllers/popular_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/Food/recommended_details.screen.dart';
import "helper/dependencies.helper.dart" as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      title: 'Ecom',
      debugShowCheckedModeBanner: false,
      home: RecommendedProductDetailScreen(),
    );
  }
}
