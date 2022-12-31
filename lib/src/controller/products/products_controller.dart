import 'package:ferisoft_test_case/src/data/model/products/product_by_id_model.dart';
import 'package:ferisoft_test_case/src/data/model/products/product_model.dart';
import 'package:ferisoft_test_case/src/data/repository/repository.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  final MyRepository repository;
  ProductsController({required this.repository});
  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  final productsLoading = false.obs;
  final productsByIdLoading = false.obs;
  final selectedProductId = 0.obs;
  final productPriceList = [].obs;
  final productNameList = [].obs;
  final productPhotoList = [].obs;

// selected produt by id variables
  final productPriceListById = [].obs;
  final productNameListById = [].obs;
  final productPhotoListById = [].obs;

  getProducts() async {
    if (!productsLoading.value) {
      productsLoading.value = true;
      var result = await repository.getProducts();

      var _productsData = productsModelFromJson(result);

      if (_productsData.isNotEmpty) {
        _productsData.forEach((element) {
          productPriceList.add(element.price);
          productNameList.add(element.name);
          productPhotoList.add(element.image);
        });
      }
    }
  }

  getProductByCategoryId() async {
    if (!productsByIdLoading.value) {
      productsByIdLoading.value = true;
      var result =
          await repository.getProductByCategoryId(selectedProductId.value);

      var _productsByIdData = productByIdModelFromJson(result);

      productPriceListById.clear();
      productNameListById.clear();
      productPhotoListById.clear();

      if (_productsByIdData.isNotEmpty) {
        _productsByIdData.forEach((element) {
          productPriceListById.add(element.price);
          productNameListById.add(element.name);
          productPhotoListById.add(element.image);
        });
        productsByIdLoading.value = false;
      }
    }
  }
}
