import 'package:ferisoft_test_case/src/data/repository/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final MyRepository repository;
  HomeController({required this.repository});
  final isSelectedCategory = false.obs;
}
