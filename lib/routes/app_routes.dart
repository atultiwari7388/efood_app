import 'package:ecom_app/screens/Food/popular/popular_food_details.dart';
import 'package:ecom_app/screens/Food/recommended/recommended_details.screen.dart';
import 'package:ecom_app/screens/bottom_bar/main_scree.bottom.dart';
import 'package:ecom_app/screens/cart/cart.screens.dart';
import 'package:ecom_app/screens/splash/splash.screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String home = "/";
  static const String splashScreen = "/splash-screen";
  static const String popularFoodDetailPage = "/popular-food-details-page";
  static const String recommendedFoodDetailPage =
      "/recommended-food-details-page";
  static const String cartPage = "/cart-page";

//create functions to pass parametes to the screen
  static String getHomeRoute() => "$home";
  static String getSplashPage() => "$splashScreen"; //splash screen
  static String getPopularFoodDetailPage(int pageId, String page) =>
      "$popularFoodDetailPage?pageId=$pageId&page=$page";
  static String getRecommendedFoodDetailPage(int pageId, String page) =>
      "$recommendedFoodDetailPage?pageId=$pageId&page=$page";
  static String getCartPage() => "$cartPage";

  static List<GetPage> routes = [
    //splashpage
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
    ),

    //!home page
    GetPage(
      name: home,
      page: () {
        return MainAppScreen();
      },
      transition: Transition.downToUp,
    ),
    //!popular food details page
    GetPage(
      name: popularFoodDetailPage,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetailScreen(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    //!recommended food details page
    GetPage(
      name: recommendedFoodDetailPage,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];

        return RecommendedProductDetailScreen(
          pageId: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.fadeIn,
    ),
    //!cart page
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
