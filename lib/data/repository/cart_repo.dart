import 'dart:convert';
import 'package:ecom_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/cart.model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  //create a method to add item to cart
  /**
   * Convert Object to String because sharedPreference only accepts String
   */
  //add item to local storage
  void addToCartList(List<CartModel> cartList) {
    // sharedPreferences.remove(AppConstants.CART_LIST);
    // sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
    cart = [];
    // cartList.forEach((element) {
    //   return cart.add(jsonEncode(element));
    // });
    //short hand code

    cartList.forEach((element) => cart.add(jsonEncode(element)));

    //after that we want to save it on shared preferences
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    //print the data
    // print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    getCartList();
  }

  //create a method to get item from cart
  //retrieve item from local storage
  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("Inside CartList" + carts.toString());
    }
    List<CartModel> cartList = [];

    //now we want to convert the string to object
    // carts.forEach((element) {
    //   cartList.add(CartModel.fromJson(jsonDecode(element)));
    // });
    //short hand code
    carts.forEach(
      (element) => cartList.add(
        CartModel.fromJson(
          jsonDecode(element),
        ),
      ),
    );

    return cartList;
  }

  //create a method to get history list
  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }

    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) {
      cartListHistory.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartListHistory;
  }

  //create a method to addToCartHistoryList

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < cart.length; i++) {
      print("Cart History List Should be  " + cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    //save the  data
    sharedPreferences.setStringList(
      AppConstants.CART_HISTORY_LIST,
      cartHistory,
    );
    //call the getCartHistoryList method
    print("The Length of history list is " +
        getCartHistoryList().length.toString());
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }
}
