import 'package:ecom_app/screens/Food/popular_food_details.dart';
import 'package:ecom_app/screens/Food/recommended_details.screen.dart';
import 'package:ecom_app/screens/home/main_food.screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String home = "/";
  static const String popularFoodDetailPage = "/popular-food-details-page";
  static const String recommendedFoodDetailPage =
      "/recommended-food-details-page";

//create functions to pass parametes to the screen
  static String getHomeRoute() => "$home";
  static String getPopularFoodDetailPage(int pageId) =>
      "$popularFoodDetailPage?pageId=$pageId";
  static String getRecommendedFoodDetailPage(int pageId) =>
      "$recommendedFoodDetailPage?pageId=$pageId";

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () {
        return MainFoodScreen();
      },
      transition: Transition.downToUp,
    ),
    GetPage(
      name: popularFoodDetailPage,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetailScreen(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFoodDetailPage,
      page: () {
        var pageId = Get.parameters['pageId'];

        return RecommendedProductDetailScreen(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
  ];
}
