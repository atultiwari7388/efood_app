import 'package:ecom_app/data/api/api_clent.dart';
import 'package:ecom_app/utils/app_constants.dart';
import 'package:get/get_connect.dart';
import 'package:get/state_manager.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
