import 'package:ecom_app/controllers/popular_product_controller.dart';
import 'package:ecom_app/utils/app_constants.dart';
import 'package:ecom_app/utils/colors.utils.dart';
import 'package:ecom_app/utils/dimensions.utils.dart';
import 'package:ecom_app/widgets/custom_top_icon.widget.dart';
import 'package:ecom_app/widgets/expandable_text.widget.dart';
import 'package:ecom_app/widgets/icon_and_text.widget.dart';
import 'package:ecom_app/widgets/large_text.widget.dart';
import 'package:ecom_app/widgets/small_text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class PopularFoodDetailScreen extends StatelessWidget {
  PopularFoodDetailScreen({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  final pageId;

  @override
  Widget build(BuildContext context) {
    var popularProductData =
        Get.find<PopularProductController>().popularProductList[pageId];

    // print("page id is " + pageId.toString());
    // print("product name is " + popularProductData.name!);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //image section
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.popularFoodImageHeight,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  image: NetworkImage(
                    AppConstants.BASE_URL +
                        AppConstants.SERVER_IMAGE_URL +
                        popularProductData.img!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // for top icons
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: AppIcon(icon: IconlyLight.arrowLeft),
                ),
                AppIcon(icon: IconlyLight.buy),
              ],
            ),
          ),
          // for product details
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImageHeight - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
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
                      SizedBox(height: Dimensions.height10),
                      CustomLargeText(text: popularProductData.name!),
                      SizedBox(height: Dimensions.height10),
                      Row(
                        children: [
                          //create stars
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(width: Dimensions.width10),
                          CustomSmallText(text: "4.5"),
                          SizedBox(width: Dimensions.width10),
                          CustomSmallText(text: "121, Reviews"),
                        ],
                      ),
                      SizedBox(height: Dimensions.height10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIconAndTextWidget(
                            iconColor: Colors.blue,
                            icon: IconlyLight.moreCircle,
                            text: "Normal",
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
                  CustomLargeText(text: "Desription"),
                  SizedBox(height: Dimensions.height20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text: popularProductData.description!),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
                  Icon(Icons.remove, color: AppColors.signColor),
                  SizedBox(width: Dimensions.width10 / 2),
                  CustomLargeText(text: "0"),
                  SizedBox(width: Dimensions.width10 / 2),
                  Icon(IconlyLight.plus, color: AppColors.signColor),
                ],
              ),
            ),
            // subTotal
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.green.withOpacity(0.86),
              ),
              child: CustomLargeText(
                text: "\₹${popularProductData.price} | Add to cart",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
