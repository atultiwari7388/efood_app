import 'package:ecom_app/controllers/cart_controller.dart';
import 'package:ecom_app/controllers/popular_product_controller.dart';
import 'package:ecom_app/controllers/recommended_product.controller.dart';
import 'package:ecom_app/data/api/api_clent.dart';
import 'package:ecom_app/data/repository/cart_repo.dart';
import 'package:ecom_app/data/repository/popular_product.repo.dart';
import 'package:ecom_app/data/repository/recommended_product.repo.dart';
import 'package:ecom_app/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //load to dependency here
  Get.lazyPut(
    () => ApiClient(appBaseUrl: AppConstants.BASE_URL),
  );
  //load the repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  // load the controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
