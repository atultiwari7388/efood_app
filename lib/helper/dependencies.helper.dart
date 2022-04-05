// create a method

import 'package:ecom_app/controllers/popular_product_controller.dart';
import 'package:ecom_app/data/api/api_clent.dart';
import 'package:ecom_app/data/repository/popular_product.repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //load to dependency here
  Get.lazyPut(() => ApiClient(appBaseUrl: "http://mvs.bslmeiyu.com"));
  //load the repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  // load the controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
