import 'package:ecom_app/data/repository/popular_product.repo.dart';
import 'package:ecom_app/models/popular_product.model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/state_manager.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  //create a list

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isProductLoaded = false;
  bool get isProductLoaded => _isProductLoaded;

  // create a method for getting the list of products in server
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      _isProductLoaded = true;
      update();
    } else {
      print("product not found");
    }
  }
}
