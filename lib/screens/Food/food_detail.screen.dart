import 'package:ecom_app/utils/colors.utils.dart';
import 'package:ecom_app/utils/dimensions.utils.dart';
import 'package:ecom_app/widgets/custom_top_icon.widget.dart';
import 'package:ecom_app/widgets/expandable_text.widget.dart';
import 'package:ecom_app/widgets/icon_and_text.widget.dart';
import 'package:ecom_app/widgets/large_text.widget.dart';
import 'package:ecom_app/widgets/small_text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class PopularFoodDetailScreen extends StatelessWidget {
  const PopularFoodDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //image section
          ImageComponent(),
          // for top icons
          TopIconsComponent(),
          // for product details
          ProductTextComponent(),
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
                text: "\₹${10} | Add to cart",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductTextComponent extends StatelessWidget {
  const ProductTextComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
            AppColumn(),
            SizedBox(height: Dimensions.height20),
            CustomLargeText(text: "Desription"),
            SizedBox(height: Dimensions.height20),
            Expanded(
              child: SingleChildScrollView(
                child: ExpandableTextWidget(
                    text:
                        "Amet et gubergren tempor eirmod et et. Amet sea lorem est accusam dolor clita no. Sit diam ipsum diam accusam magna justo et. Amet dolore aliquyam eirmod magna sanctus elitr aliquyam. Eos at gubergren at et amet magna et eos voluptua, diam lorem clita duo sed invidunt elitr justo et. Erat clita sanctus sadipscing eirmod labore sanctus stet stet kasd.."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopIconsComponent extends StatelessWidget {
  const TopIconsComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimensions.height45,
      left: Dimensions.width20,
      right: Dimensions.width20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppIcon(icon: IconlyLight.arrowLeft),
          AppIcon(icon: IconlyLight.buy),
        ],
      ),
    );
  }
}

class ImageComponent extends StatelessWidget {
  const ImageComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        height: Dimensions.popularFoodImageHeight,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            image: NetworkImage(
                "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcurlytales.com%2Fwp-content%2Fuploads%2F2019%2F11%2FSamosa-Recipe.jpg&f=1&nofb=1"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class AppColumn extends StatelessWidget {
  const AppColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Dimensions.height10),
        CustomLargeText(text: "Motu ke fav Samose"),
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
    );
  }
}
