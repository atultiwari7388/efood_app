import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecom_app/controllers/popular_product_controller.dart';
import 'package:ecom_app/utils/app_constants.dart';
import 'package:ecom_app/utils/dimensions.utils.dart';
import 'package:ecom_app/widgets/icon_and_text.widget.dart';
import 'package:ecom_app/widgets/large_text.widget.dart';
import 'package:ecom_app/widgets/small_text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class FoodBody extends StatefulWidget {
  const FoodBody({Key? key}) : super(key: key);

  @override
  _FoodBodyState createState() => _FoodBodyState();
}

class _FoodBodyState extends State<FoodBody> {
  PageController pageController = PageController(viewportFraction: 0.89);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.cardPageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //using get builder
        GetBuilder<PopularProductController>(
          builder: (popularProductsController) {
            return popularProductsController.isProductLoaded
                ? Container(
                    height: Dimensions.cardPageView,
                    // color: Colors.red,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount:
                          popularProductsController.popularProductList.length,
                      itemBuilder: (context, position) {
                        var data = popularProductsController
                            .popularProductList[position];

                        return _buildPageItem(position, data);
                      },
                    ),
                  )
                : Container(
                    height: Dimensions.cardPageView,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
          },
        ),
        SizedBox(height: Dimensions.height10),
        GetBuilder<PopularProductController>(
          builder: (popularProductsController) {
            return DotsIndicator(
              dotsCount: popularProductsController.popularProductList.isEmpty
                  ? 1
                  : popularProductsController.popularProductList.length,
              position: _currentPageValue,
              decorator: DotsDecorator(
                activeColor: Colors.green.withOpacity(0.67),
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            );
          },
        ),
        // popular products

        SizedBox(height: Dimensions.height30),

        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomLargeText(text: "Recommended", color: Colors.black),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: CustomLargeText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                child: CustomSmallText(text: "Veg Products"),
              ),
            ],
          ),
        ),
        // list of food items

        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: Dimensions.height10,
              ),
              child: Row(
                children: [
                  //for image
                  Container(
                    height: Dimensions.listViewImageWidthSize,
                    width: Dimensions.listViewImageWidthSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.rasoirani.com%2Fwp-content%2Fuploads%2F2020%2F04%2Fmasala-dosa.jpg&f=1&nofb=1"),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.red,
                    ),
                  ),
                  // for texts
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewImageHeightSize,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: Dimensions.width10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomLargeText(text: "Masala Dosha with Curry "),
                            SizedBox(height: Dimensions.height10),
                            CustomSmallText(text: "Masala Dosha with Curry "),
                            SizedBox(height: Dimensions.height10),
                            Row(
                              children: [
                                CustomIconAndTextWidget(
                                  iconColor: Colors.red,
                                  icon: IconlyLight.location,
                                  text: "1.7Kms",
                                ),
                                SizedBox(width: Dimensions.width20),
                                CustomIconAndTextWidget(
                                  iconColor: Colors.green,
                                  icon: IconlyLight.timeCircle,
                                  text: "32min",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index, popularProductData) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);

      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: _height,
            margin: EdgeInsets.only(
                left: Dimensions.width5, right: Dimensions.width5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven ? Color(0xff69c5df) : Color(0xff9294cc),
              // color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  AppConstants.BASE_URL + "/uploads/" + popularProductData.img!,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.cardPageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                // color: index.isEven ? Colors.white : Colors.green,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 5),
                    blurRadius: 5.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height15,
                ),
                child: Column(
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
