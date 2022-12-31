import 'package:ferisoft_test_case/src/data/model/categories/categories_model.dart';
import 'package:ferisoft_test_case/src/data/repository/repository.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final MyRepository repository;
  CategoriesController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  final categoriesLoading = false.obs;

  final categoriesNameList = [].obs;

  getCategories() async {
    if (!categoriesLoading.value) {
      categoriesLoading.value = true;

      var result = await repository.getCategories();

      var _categoriesData = categoriesModelFromJson(result);

      if (_categoriesData.isNotEmpty) {
        _categoriesData.forEach((element) {
          categoriesNameList.add(element.name);
        });
      }
    }
  }
}
