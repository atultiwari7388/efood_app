import 'package:ecom_app/data/api/api_clent.dart';
import 'package:get/get_connect.dart';
import 'package:get/state_manager.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData("/api/v1/products/popular");
  }
}
