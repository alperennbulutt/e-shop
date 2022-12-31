import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginTextFieldWidget extends StatelessWidget {
  const LoginTextFieldWidget({
    Key? key,
    required this.loginAppBarTitleFontSize,
    required this.textEditingController,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String title;
  final Icon icon;
  final double loginAppBarTitleFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // email textfield part
        Row(
          children: [
            // icon part
            Column(
              children: [icon],
            ),

            SizedBox(
              width: 5,
            ),

            // textfield part

            Column(
              children: [
                Container(
                    width: Get.width * 0.8,
                    height: Get.height * 0.05,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: textEditingController,
                    )),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
