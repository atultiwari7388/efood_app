import 'package:ecom_app/data/repository/cart_repo.dart';
import 'package:ecom_app/models/cart.model.dart';
import 'package:ecom_app/models/popular_product.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  //create a map to save data locally

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  //create a function
  void addItem(ProductModel productModel, int quantity) {
    //once this method is called we want to save it on this map
    //check the duplicate product

    if (_items.containsKey(productModel.id!)) {
      var totalQuantity = 0;
      _items.update(productModel.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          productModel: productModel,
        );
      });

      if (totalQuantity <= 0) {
        _items.remove(productModel.id!);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(productModel.id!, () {
          return CartModel(
            id: productModel.id,
            name: productModel.name,
            price: productModel.price,
            img: productModel.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            productModel: productModel,
          );
        });
      } else {
        Get.snackbar(
          "Item Count",
          "You should add at least one item to cart",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
    update();
  }

  //create a function to isProductExist

  bool existInCart(ProductModel productModel) {
    if (_items.containsKey(productModel.id)) {
      return true;
    } else {
      return false;
    }
  }

  //create a function to get the quantity of product

  int getQuantity(ProductModel productModel) {
    //create local variable
    var quantity = 0;
    if (_items.containsKey(productModel.id)) {
      _items.forEach((key, value) {
        if (key == productModel.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  // create gretter to show total add items in cart label

  int get totalItems {
    var totalQuantity = 0;
    //access the data inside of it, we need to find the items in or the quantity in these items
    _items.forEach((key, value) {
      // totalQuantity = totalQuantity + value.quantity;
      totalQuantity += value.quantity!;
    });

    return totalQuantity;
  }

  //create getter function, where would be able to get the objects
  List<CartModel> get getCartItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  //create subtotal of all items in cart
  int get totalCartPrice {
    var total = 0;
    _items.forEach((key, value) {
      // total = value.quantity! * value.price!;
      total += value.quantity! * value.price!;
    });
    return total;
  }
}
