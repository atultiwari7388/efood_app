import 'package:ecom_app/data/repository/recommended_product.repo.dart';
import 'package:ecom_app/models/popular_product.model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/state_manager.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

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
      print("got recommended products");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isProductLoaded = true;
      update();
    } else {
      print("product not found");
    }
  }
}
