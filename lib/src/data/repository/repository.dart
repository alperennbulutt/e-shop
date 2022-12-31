import 'package:ferisoft_test_case/src/data/services/api.dart';

class MyRepository {
  final MyApiClient apiClient;

  MyRepository({required this.apiClient});

  login(String email, String password) {
    return apiClient.login(email, password);
  }

  getCategories() {
    return apiClient.getCategories();
  }

  getProducts() {
    return apiClient.getProducts();
  }

  getProductByCategoryId(int selectedProductId) {
    return apiClient.getProductByCategoryId(selectedProductId);
  }
}
