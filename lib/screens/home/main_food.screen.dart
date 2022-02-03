import 'package:ecom_app/screens/home/food_body.dart';
import 'package:ecom_app/utils/dimensions.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class MainFoodScreen extends StatefulWidget {
  const MainFoodScreen({Key? key}) : super(key: key);

  @override
  _MainFoodScreenState createState() => _MainFoodScreenState();
}

class _MainFoodScreenState extends State<MainFoodScreen> {
  ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(
        () {
          setState(
            () {
              if (_scrollController.offset >= 400) {
                _showBackToTopButton = true; // show the back-to-top button
              } else {
                _showBackToTopButton = false; // hide the back-to-top button
              }
            },
          );
        },
      );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(seconds: 2),
      curve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height.toString());
    print(MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            //top section
            TopComponent(),
            // card Slider
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: FoodBody(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: _scrollToTop,
              child: Icon(IconlyBold.arrowUp),
            ),
    );
  }
}

class TopComponent extends StatelessWidget {
  const TopComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: Dimensions.height45, bottom: Dimensions.height15),
      padding:
          EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
      child: TextFormField(
        //search bar
        decoration: InputDecoration(
          prefixIcon: Icon(
            IconlyLight.search,
            color: Colors.grey,
            size: Dimensions.iconSize24,
          ),
          hintText: 'Search food',
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.black12,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        ),
      ),
    );
  }
}



// Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             children: [
//               CustomLargeText(
//                 text: "Country",
//                 fontSize: 30.0,
//                 color: AppColors.mainColor,
//               ),
//               Row(
//                 children: [
//                   CustomSmallText(
//                     text: "India",
//                     color: Colors.black,
//                   ),
//                   Icon(Icons.arrow_drop_down),
//                 ],
//               ),
//             ],
//           ),
//           Center(
//             child: Container(
//               width: 45,
//               height: 45,
//               decoration: BoxDecoration(
//                 color: Colors.red,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Icon(IconlyLight.search, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
    