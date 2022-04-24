import 'package:ecom_app/controllers/cart_controller.dart';
import 'package:ecom_app/data/repository/recommended_product.repo.dart';
import 'package:ecom_app/models/popular_product.model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  late CartController _cartController;

  RecommendedProductController({required this.recommendedProductRepo});

  //create list
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isProductLoaded = false;
  bool get isProductLoaded => _isProductLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();

    if (response.statusCode == 200) {
      // print("got recommended products");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isProductLoaded = true;
      update();
    } else {
      // print("product not found");
    }
  }

  //create a method for set the quantity of product
  // void setQuantity(bool isIncrement) {
  //   if (isIncrement) {
  //     // print("increment" + _quantity.toString());
  //     //increase quantity
  //     // _quantity = _quantity + 1;
  //     _quantity = checkQuantity(_quantity + 1);
  //   } else {
  //     //decrease quantity
  //     // _quantity = _quantity - 1;
  //     _quantity = checkQuantity(_quantity - 1);
  //   }
  //   update();
  // }

  // //create a function for checking the quantity of product is greater than 0 or not
  // int checkQuantity(int quantity) {
  //   if ((_inCartItems + quantity) < 0) {
  //     //show an error msg
  //     Get.snackbar(
  //       "Item Count",
  //       "You can't have a negative item count",
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );

  //     if (_inCartItems > 0) {
  //       _quantity = -_inCartItems;
  //       return _quantity;
  //     }

  //     return 0;
  //   } else if ((_inCartItems + quantity) > 10) {
  //     Get.snackbar(
  //       "Item Count",
  //       "You can't add more than 10 items",
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     return 10;
  //   } else {
  //     return quantity;
  //   }
  // }

  // // create a function for checking current things or product.

  // void initProduct(ProductModel productModel, CartController cartController) {
  //   _quantity = 0;
  //   _inCartItems = 0;
  //   _cartController = cartController;
  //   var exists = false;
  //   exists = _cartController.existInCart(productModel);

  //   print("exists or not " + exists.toString());
  //   //conditional check if previous product data saved or not, if it is saved we'll take that data, so fresh data coming from somewhere that has been saved
  //   // get from storage and set it inCartItems=3
  //   // if(exits){
  //   //  _inCartItems = 3;
  //   // } else{
  //   // _inCartItems=0;
  //   // }

  //   if (exists) {
  //     _inCartItems = _cartController.getQuantity(productModel);
  //   }
  //   print("The Quantity in the cart is " + _inCartItems.toString());
  // }

  // //create new function for adding product to cart

  // void addItem(ProductModel productModel) {
  //   //here we call the cartController function

  //   _cartController.addItem(productModel, _quantity);
  //   _quantity = 0;

  //   _inCartItems = _cartController.getQuantity(productModel);

  //   _cartController.items.forEach((key, value) {
  //     print(
  //       "The id is" +
  //           value.id.toString() +
  //           "The quantity is" +
  //           value.quantity.toString(),
  //     );
  //   });
  //   update();
  // }

  // //we'll put all of them together

  // int get totalItems {
  //   return _cartController.totalItems;
  // }

}
