import 'package:badges/badges.dart';
import 'package:ecom_app/controllers/cart_controller.dart';
import 'package:ecom_app/controllers/popular_product_controller.dart';
import 'package:ecom_app/routes/app_routes.dart';
import 'package:ecom_app/utils/colors.utils.dart';
import 'package:ecom_app/utils/dimensions.utils.dart';
import 'package:ecom_app/widgets/custom_top_icon.widget.dart';
import 'package:ecom_app/widgets/expandable_text.widget.dart';
import 'package:ecom_app/widgets/icon_and_text.widget.dart';
import 'package:ecom_app/widgets/large_text.widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class PopularFoodDetailScreen extends StatelessWidget {
  PopularFoodDetailScreen({
    Key? key,
    required this.pageId,
    required this.page,
  }) : super(key: key);

  final int pageId;
  final String page;

  @override
  Widget build(BuildContext context) {
    var popularProductData =
        Get.find<PopularProductController>().popularProductList[pageId];

    //checking new product item is 0
    Get.find<PopularProductController>()
        .initProduct(popularProductData, Get.find<CartController>());

    // print("page id is " + pageId.toString());
    // print("product name is " + popularProductData.name!);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundLightColor,
      body: Stack(
        children: [
          //top icon section
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (page == "cartpage") {
                      Get.toNamed(AppRoutes.getCartPage());
                    } else {
                      Get.toNamed(AppRoutes.home);
                    }
                  },
                  child: AppIcon(icon: IconlyLight.arrowLeft),
                ),
                GetBuilder<PopularProductController>(
                    builder: (popularProductController) {
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (Get.find<PopularProductController>().totalItems >=
                              1)
                            Get.toNamed(
                              AppRoutes.getCartPage(),
                            );
                        },
                        child: AppIcon(icon: IconlyLight.buy),
                      ),
                      // for badge
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                              right: 10,
                              top: 0,
                              child: Badge(
                                animationType: BadgeAnimationType.scale,
                                badgeContent: Text(
                                  Get.find<PopularProductController>()
                                      .totalItems
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                badgeColor: Colors.red,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  );
                })
              ],
            ),
          ),

          //for product details page
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImageHeight - 110,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height30 + 115,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // add && remove quantity
                      GetBuilder<PopularProductController>(
                          builder: (productControllerQuantity) {
                        return Container(
                          // width: 150,
                          margin: EdgeInsets.only(left: 90, right: 90),
                          padding: EdgeInsets.only(
                            top: Dimensions.height15,
                            bottom: Dimensions.height15,
                            left: Dimensions.width30,
                            right: Dimensions.width30,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20 + 10),
                            color: AppColors.mainColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  productControllerQuantity.setQuantity(false);
                                },
                                child:
                                    Icon(EvaIcons.minus, color: Colors.white),
                              ),
                              CustomLargeText(
                                text: productControllerQuantity.inCartItems
                                    .toString(),
                                color: Colors.white,
                              ),
                              GestureDetector(
                                onTap: () {
                                  productControllerQuantity.setQuantity(true);
                                },
                                child: Icon(EvaIcons.plus, color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      }),
                      SizedBox(height: Dimensions.height30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomLargeText(text: popularProductData.name!),
                          RichText(
                            text: TextSpan(
                              text: "₹ ",
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: Dimensions.font12 + 3,
                              ),
                              children: [
                                TextSpan(
                                  text: popularProductData.price!.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.font20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Dimensions.height10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIconAndTextWidget(
                            iconColor: Colors.orange,
                            icon: IconlyBold.star,
                            text: "4.5",
                          ),
                          CustomIconAndTextWidget(
                            iconColor: Colors.red,
                            icon: IconlyLight.location,
                            text: "1.7Kms",
                          ),
                          CustomIconAndTextWidget(
                            iconColor: Colors.green,
                            icon: IconlyLight.timeCircle,
                            text: "32min",
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: popularProductData.description!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // for image
          Positioned(
            left: Dimensions.width30 - 5,
            right: Dimensions.width30 - 5,
            top: Dimensions.height30 - 40,
            bottom: Dimensions.height100 - 35,
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height120 + 10,
                  bottom: Dimensions.height300 - 65),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.freepngimg.com%2Fthumb%2Fandroid%2F67382-food-big-hamburger-fast-burger-png-download-free.png&f=1&nofb=1"
                      // AppConstants.BASE_URL +
                      //     AppConstants.SERVER_IMAGE_URL +
                      //     popularProductData.img!,
                      ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomBar(popularProductData),
    );
  }

  Widget buildBottomBar(popularProductData) {
    return GetBuilder<PopularProductController>(
      builder: (productControllerQuantity) {
        return Container(
          color: Colors.white,
          child: GestureDetector(
            onTap: () {
              productControllerQuantity.addItem(popularProductData);
            },
            child: Container(
              margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
                bottom: Dimensions.height10,
              ),
              height: 60,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: CustomLargeText(
                  text: "Add to Cart",
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
