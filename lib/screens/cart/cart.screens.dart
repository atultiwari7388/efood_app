import 'package:ecom_app/controllers/cart_controller.dart';
import 'package:ecom_app/controllers/popular_product_controller.dart';
import 'package:ecom_app/controllers/recommended_product.controller.dart';
import 'package:ecom_app/routes/app_routes.dart';
import 'package:ecom_app/utils/app_constants.dart';
import 'package:ecom_app/utils/colors.utils.dart';
import 'package:ecom_app/utils/dimensions.utils.dart';
import 'package:ecom_app/widgets/custom_top_icon.widget.dart';
import 'package:ecom_app/widgets/large_text.widget.dart';
import 'package:ecom_app/widgets/small_text.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //top
          Positioned(
            top: Dimensions.height20 * 2,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
                SizedBox(width: Dimensions.width20 * 5),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.getHomeRoute(),
                    );
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
              ],
            ),
          ),
          //body
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height10),
              // color: Colors.red,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(
                  builder: (cartController) {
                    //!simplified
                    var _cartList = cartController.getCartItems;
                    return ListView.builder(
                      itemCount: _cartList.length,
                      itemBuilder: (_, index) {
                        var _cartData = cartController.getCartItems[index];

                        return Container(
                          height: Dimensions.height100,
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              //image section
                              GestureDetector(
                                onTap: () {
                                  var popularIndex =
                                      Get.find<PopularProductController>()
                                          .popularProductList
                                          .indexOf(_cartData.productModel!);

                                  if (popularIndex >= 0) {
                                    Get.toNamed(
                                      AppRoutes.getPopularFoodDetailPage(
                                        popularIndex,
                                        "cartpage",
                                      ),
                                    );
                                  } else {
                                    var recommendedIndex =
                                        Get.find<RecommendedProductController>()
                                            .recommendedProductList
                                            .indexOf(_cartData.productModel!);

                                    Get.toNamed(
                                      AppRoutes.getRecommendedFoodDetailPage(
                                        recommendedIndex,
                                        "cartpage",
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: Dimensions.height100,
                                  width: Dimensions.height100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        AppConstants.BASE_URL +
                                            AppConstants.SERVER_IMAGE_URL +
                                            _cartData.img!,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              //info section
                              SizedBox(width: Dimensions.width10),
                              Expanded(
                                child: Container(
                                  height: Dimensions.height100,
                                  // color: Colors.black,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //product name
                                      CustomLargeText(
                                        text: _cartData.name!,
                                        color: Colors.black,
                                      ),
                                      // product type
                                      CustomSmallText(
                                        text: "Nonveg",
                                        color: Colors.grey.shade500,
                                      ),
                                      // product price && quantity
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //product price
                                          Text(
                                            "\₹${_cartData.price}",
                                            style: TextStyle(
                                              fontSize: Dimensions.height15 + 2,
                                              color: Colors.orange,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Container(
                                            width: Dimensions.height100,
                                            height: Dimensions.height20 * 1.5,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: AppColors.mainColor,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                //remove product quantity
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(
                                                      _cartData.productModel!,
                                                      -1,
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Color.fromARGB(
                                                        255, 245, 240, 240),
                                                  ),
                                                ),
                                                Container(
                                                  width: Dimensions.width20,
                                                  height: Dimensions.height20,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                .radius20),
                                                    color: Colors.grey.shade200,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      _cartData.quantity
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                //add product quantity
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(
                                                      _cartData.productModel!,
                                                      1,
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Color.fromARGB(
                                                        255, 245, 240, 240),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
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
                //add and remove items
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: Dimensions.width10 / 2),
                      //all product subtotal
                      CustomLargeText(
                        text: "₹" + cartController.totalCartPrice.toString(),
                      ),
                      SizedBox(width: Dimensions.width10 / 2),
                    ],
                  ),
                ),
                SizedBox(width: Dimensions.width10),
                // subTotal
                GestureDetector(
                  onTap: () {
                    print("Tapped");
                    cartController.addToHistory();
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                    child: CustomLargeText(
                      text: "Check Out",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
