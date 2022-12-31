import 'package:ferisoft_test_case/src/constants/endpoints.dart';
import 'package:ferisoft_test_case/src/constants/local_strings.dart';
import 'package:ferisoft_test_case/src/controller/local_storage/local_storage_controller.dart';
import 'package:ferisoft_test_case/src/controller/login/login_controller.dart';
import 'package:ferisoft_test_case/src/controller/products/products_controller.dart';
import 'package:ferisoft_test_case/src/data/repository/repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MyApiClient {
  late http.Client httpClient;

  getJwtToken() {
    final localStorageController = Get.put(LocalStorageController());
    return localStorageController
        .getStringFromLocal(LocalStorageConstants.jwtToken);
  }

  login(String email, String password) async {
    final controller = Get.put(
        LoginController(repository: MyRepository(apiClient: MyApiClient())));
    var request = http.Request(
        'POST',
        // ignore: prefer_interpolation_to_compose_strings
        Uri.parse(EndPoint.base_url +
            "login?password=" +
            password +
            "&email=" +
            email));

    request.followRedirects = false;

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      controller.loginLoading.value = false;
      var result = await response.stream.bytesToString();

      return result;
    } else {
      controller.loginLoading.value = false;
      Get.snackbar('Error', 'Email or Password not correct!');
      throw Exception();
    }
  }

  getCategories() async {
    var headers = {'Authorization': 'Bearer ${getJwtToken()}'};
    var request =
        http.Request('GET', Uri.parse(EndPoint.base_url + EndPoint.category));

    request.headers.addAll(headers);
    request.followRedirects = false;

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();

      return result;
    } else {
      Get.snackbar('Error', 'Something went wrong!');

      print(response.reasonPhrase);
      throw Exception();
    }
  }

  getProducts() async {
    var headers = {'Authorization': 'Bearer ${getJwtToken()}'};
    var request =
        http.Request('GET', Uri.parse(EndPoint.base_url + EndPoint.product));

    request.headers.addAll(headers);
    request.followRedirects = false;

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();

      return result;
    } else {
      Get.snackbar('Error', 'Something went wrong!');

      print(response.reasonPhrase);
      throw Exception();
    }
  }

  getProductByCategoryId(int selectedProductId) async {
    final controller = Get.put(
        ProductsController(repository: MyRepository(apiClient: MyApiClient())));
    var headers = {'Authorization': 'Bearer ${getJwtToken()}'};
    var request = http.Request(
        'GET',
        Uri.parse(EndPoint.base_url +
            EndPoint.productById +
            selectedProductId.toString()));

    request.headers.addAll(headers);
    request.followRedirects = false;

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      controller.productsByIdLoading.value = false;

      return result;
    } else {
      Get.snackbar('Error', 'Something went wrong!');
      controller.productsByIdLoading.value = false;

      print(response.reasonPhrase);
      throw Exception();
    }
  }
}
