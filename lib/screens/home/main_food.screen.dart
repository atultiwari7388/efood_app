import 'package:ecom_app/screens/home/card_slider.screen.dart';
import 'package:ecom_app/utils/dimensions.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class MainFoodScreen extends StatefulWidget {
  const MainFoodScreen({Key? key}) : super(key: key);

  @override
  _MainFoodScreenState createState() => _MainFoodScreenState();
}

class _MainFoodScreenState extends State<MainFoodScreen> {
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
                child: ProductCardSlider(),
              ),
            ),
          ],
        ),
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
    