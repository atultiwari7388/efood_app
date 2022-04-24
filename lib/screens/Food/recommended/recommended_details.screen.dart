import 'package:badges/badges.dart';
import 'package:ecom_app/controllers/recommended_product.controller.dart';
import 'package:ecom_app/routes/app_routes.dart';
import 'package:ecom_app/utils/colors.utils.dart';
import 'package:ecom_app/utils/dimensions.utils.dart';
import 'package:ecom_app/widgets/custom_top_icon.widget.dart';
import 'package:ecom_app/widgets/expandable_text.widget.dart';
import 'package:ecom_app/widgets/large_text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

import '../../../controllers/cart_controller.dart';
import '../../../controllers/popular_product_controller.dart';
import '../../../utils/app_constants.dart';

class RecommendedProductDetailScreen extends StatelessWidget {
  const RecommendedProductDetailScreen(
      {Key? key, required this.pageId, required this.page})
      : super(key: key);
  final int pageId;
  final String page;

  @override
  Widget build(BuildContext context) {
    var recommendedProductData =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(recommendedProductData, Get.find<CartController>());

    // print(pageId.toString());
    // print(recommendedProductData.name!);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: Dimensions.height300,
            backgroundColor: Colors.green,
            elevation: 1.0,
            toolbarHeight: Dimensions.height80,
            title: Row(
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
                  child: AppIcon(icon: Icons.clear),
                ),
                GetBuilder<RecommendedProductController>(
                    builder: (recommendedProductController) {
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
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL +
                    AppConstants.SERVER_IMAGE_URL +
                    recommendedProductData.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height20),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height5,
                  bottom: Dimensions.height10,
                ),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Center(
                  child: CustomLargeText(
                    text: recommendedProductData.name!,
                    fontSize: Dimensions.font26,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    // top: Dimensions.height10,
                  ),
                  child: ExpandableTextWidget(
                    text: recommendedProductData.description!,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (productControllerQuantity) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20 * 2.5,
                  right: Dimensions.width20 * 2.5,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        productControllerQuantity.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        backgroundColor: Colors.green,
                        iconColor: Colors.white,
                      ),
                    ),
                    CustomLargeText(
                        text:
                            "\₹${recommendedProductData.price} X ${productControllerQuantity.inCartItems}"),
                    GestureDetector(
                      onTap: () {
                        productControllerQuantity.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        backgroundColor: Colors.green,
                        iconColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height10 / 2),
              Container(
                height: Dimensions.bottomHeightBar,
                padding: EdgeInsets.only(
                  top: Dimensions.height30,
                  bottom: Dimensions.height30,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white,
                      ),
                      child: Icon(
                        IconlyBold.heart,
                        color: Colors.green,
                      ),
                    ),
                    // subTotal
                    GestureDetector(
                      onTap: () {
                        productControllerQuantity
                            .addItem(recommendedProductData);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.green.withOpacity(0.86),
                        ),
                        child: CustomLargeText(
                          text:
                              "\₹${recommendedProductData.price} | Add to cart",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
