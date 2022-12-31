import 'package:ferisoft_test_case/src/controller/home/home_conttoller.dart';
import 'package:ferisoft_test_case/src/data/repository/repository.dart';
import 'package:ferisoft_test_case/src/data/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCustomCardWidget extends StatelessWidget {
  ProductCustomCardWidget(
      {Key? key,
      required this.price,
      required this.name,
      required this.image,
      this.isVisibleAddToBasketButton})
      : super(key: key);

  final String price;
  final String name;
  final String image;

  final bool? isVisibleAddToBasketButton;

  final controller = Get.put(
      HomeController(repository: MyRepository(apiClient: MyApiClient())));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // foto
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: Get.width / 2,
            height: Get.height * 0.18,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 15, 15, 15),
              ),
            ),
            child: Column(
              children: [
                Image.network(
                  image,
                  cacheWidth: (Get.width / 2).toInt(),
                  cacheHeight: (Get.height * 0.19).toInt(),
                )
              ],
            ),
          ),
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          maxLines: 3,
          style: TextStyle(),
        ),

        Text('Price: ' + price),
      ],
    );
  }
}
