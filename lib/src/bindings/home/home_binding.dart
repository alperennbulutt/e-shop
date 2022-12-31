import 'package:ferisoft_test_case/src/controller/home/home_conttoller.dart';
import 'package:ferisoft_test_case/src/data/repository/repository.dart';
import 'package:ferisoft_test_case/src/data/services/api.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() =>
        HomeController(repository: MyRepository(apiClient: MyApiClient())));
  }
}
