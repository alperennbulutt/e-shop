import 'package:ferisoft_test_case/src/controller/login/login_controller.dart';
import 'package:ferisoft_test_case/src/data/repository/repository.dart';
import 'package:ferisoft_test_case/src/data/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButtonWidget extends StatelessWidget {
  LoginButtonWidget({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(
      LoginController(repository: MyRepository(apiClient: MyApiClient())));
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Get.width * 0.9,
          height: 44.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 250, 66, 66),
                Colors.purple,
                Colors.blue,
                Colors.green,
                Colors.yellow
              ])),
          child: ElevatedButton(
            onPressed: () {
              print('pressed');
              controller.login();
            },
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent),
            child: const Text(
              'Üye Ol',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
