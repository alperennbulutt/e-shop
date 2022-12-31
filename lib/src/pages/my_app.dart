import 'package:ferisoft_test_case/src/constants/local_strings.dart';
import 'package:ferisoft_test_case/src/controller/login/login_controller.dart';
import 'package:ferisoft_test_case/src/data/repository/repository.dart';
import 'package:ferisoft_test_case/src/data/services/api.dart';
import 'package:ferisoft_test_case/src/pages/home/home_page.dart';
import 'package:ferisoft_test_case/src/pages/login/login_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/local_storage/local_storage_controller.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final loginController = Get.put(
      LoginController(repository: MyRepository(apiClient: MyApiClient())));
  final localStorageController = Get.put(LocalStorageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: localStorageController
              .getBooleanFromLocal(LocalStorageConstants.isLogin)
          ? HomePage()
          : LoginPage(),
    );
  }
}
