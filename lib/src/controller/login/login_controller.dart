import 'package:ferisoft_test_case/src/constants/local_strings.dart';
import 'package:ferisoft_test_case/src/controller/local_storage/local_storage_controller.dart';
import 'package:ferisoft_test_case/src/data/model/login/login_model.dart';
import 'package:ferisoft_test_case/src/data/repository/repository.dart';
import 'package:ferisoft_test_case/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final MyRepository repository;
  LoginController({required this.repository});

  String loginAppBarTitle = 'LOGO';
  Color loginAppBarColor = const Color.fromARGB(255, 241, 138, 53);

  final emailTextEditingController = TextEditingController().obs;
  final passwordTextEditingController = TextEditingController().obs;
  double loginAppBarTitleFontSize = Get.width * 0.1;

  final loginLoading = false.obs;

// bu değişkenin gerçek projelerde local storage'de tutulması gerekiyor
  final isLogin = false.obs;

  final localStorageController = Get.put(LocalStorageController());

  login() async {
    if (!loginLoading.value) {
      loginLoading.value = true;

      var result = await repository.login(emailTextEditingController.value.text,
          passwordTextEditingController.value.text);

      var _loginResponse = loginModelFromJson(result);

      if (_loginResponse.message != null) {
        loginLoading.value = false;
        print('giriş başarili');

        isLogin.value = true;
        String jwtToken = _loginResponse.message!.token!;
        print('1');
        await localStorageController.saveBooleanToLocal(
            LocalStorageConstants.isLogin, true);
        await localStorageController.saveStringToLocal(
            LocalStorageConstants.jwtToken, jwtToken);

        Get.to(HomePage());
        print('2');
      } else {
        loginLoading.value = false;
        isLogin.value = false;

        print('something wrong!');
      }
    }
  }
}
