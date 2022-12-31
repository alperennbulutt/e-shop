import 'package:ferisoft_test_case/src/data/repository/repository.dart';
import 'package:ferisoft_test_case/src/data/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login/login_controller.dart';

class CustomAppTitle extends StatelessWidget {
  CustomAppTitle({
    Key? key,
    required this.loginAppBarColor,
  }) : super(key: key);

  final controller = Get.put(
      LoginController(repository: MyRepository(apiClient: MyApiClient())));

  final Color loginAppBarColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      controller.loginAppBarTitle,
      style: TextStyle(
          color: loginAppBarColor,
          fontSize: controller.loginAppBarTitleFontSize),
    );
  }
}
