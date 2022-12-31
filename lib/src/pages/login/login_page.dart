import 'package:ferisoft_test_case/src/controller/login/login_controller.dart';
import 'package:ferisoft_test_case/src/data/repository/repository.dart';
import 'package:ferisoft_test_case/src/data/services/api.dart';
import 'package:ferisoft_test_case/src/widgets/app_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/login_button_widget.dart';
import 'widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.put(
      LoginController(repository: MyRepository(apiClient: MyApiClient())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustomAppTitle(
          loginAppBarColor: controller.loginAppBarColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.04,
            ),

            // giriş yap text
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Giriş Yap',
                style: TextStyle(
                    fontSize: controller.loginAppBarTitleFontSize * 0.6,
                    fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Padding(
              padding: EdgeInsets.only(left: Get.width * 0.08),
              child: Text(
                'E-mail',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            Obx(
              () => LoginTextFieldWidget(
                loginAppBarTitleFontSize: controller.loginAppBarTitleFontSize,
                title: 'Email',
                icon: Icon(Icons.email, size: 30),
                textEditingController:
                    controller.emailTextEditingController.value,
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Padding(
              padding: EdgeInsets.only(left: Get.width * 0.08),
              child: Text(
                'Şifre',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            Obx(
              () => LoginTextFieldWidget(
                  loginAppBarTitleFontSize: controller.loginAppBarTitleFontSize,
                  textEditingController:
                      controller.passwordTextEditingController.value,
                  title: 'Password',
                  icon: Icon(Icons.lock, size: 30)),
            ),

            SizedBox(height: Get.height * 0.1),

            // login button
            LoginButtonWidget()
          ],
        ),
      ),
    );
  }
}
