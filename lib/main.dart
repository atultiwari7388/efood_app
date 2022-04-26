import 'package:ecom_app/controllers/cart_controller.dart';
import 'package:ecom_app/controllers/popular_product_controller.dart';
import 'package:ecom_app/controllers/recommended_product.controller.dart';
import 'package:ecom_app/routes/app_routes.dart';
import 'package:ecom_app/screens/splash/splash.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          title: 'Ecom',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.getSplashPage(),
          getPages: AppRoutes.routes,
        );
      });
    });
  }
}
