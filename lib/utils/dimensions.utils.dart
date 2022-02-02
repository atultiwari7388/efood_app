import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //for card slider

  static double cardPageView = screenHeight / 2.37;
  static double cardPageViewContainer = screenHeight / 3.45;
  static double cardPageViewTextContainer = screenHeight / 6.3;

  //for dynamic height spacing

  static double height10 = screenHeight / 76.0;
  static double height15 = screenHeight / 50.6;
  static double height20 = screenHeight / 38.0;
  static double height30 = screenHeight / 25.3;
  static double height45 = screenHeight / 16.8;
  static double height100 = screenHeight / 7.6;
  static double height120 = screenHeight / 5.83;

  //for dynamic width spacing

  static double width5 = screenHeight / 152.0;
  static double width10 = screenHeight / 76.0;
  static double width20 = screenHeight / 38.0;
  static double width15 = screenHeight / 50.6;
  static double width30 = screenHeight / 25.3;
  static double width120 = screenHeight / 5.83;

//for font size

  static double font12 = screenHeight / 63.33;
  static double font20 = screenHeight / 38.0;

//for border radius\\

  static double radius10 = screenHeight / 76.0;
  static double radius20 = screenHeight / 38.0;
  static double radius30 = screenHeight / 25.3;

  //for icon size

  static double iconSize24 = screenHeight / 31.66;

  // for listview image width

  static double listViewImageWidthSize = screenWidth / 3.0;
  static double listViewImageHeightSize = screenWidth / 3.6;
}
