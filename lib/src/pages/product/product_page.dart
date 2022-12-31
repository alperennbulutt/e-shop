import 'package:ferisoft_test_case/src/controller/products/products_controller.dart';
import 'package:ferisoft_test_case/src/data/repository/repository.dart';
import 'package:ferisoft_test_case/src/data/services/api.dart';
import 'package:ferisoft_test_case/src/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final productsController = Get.put(
      ProductsController(repository: MyRepository(apiClient: MyApiClient())));

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: Get.width,
        height: ((productsController.productNameListById.length) / 2) *
            Get.height *
            0.5,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: productsController.productNameListById.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: ProductCustomCardWidget(
                image: productsController.productPhotoListById[index],
                name: productsController.productNameListById[index],
                price: productsController.productPriceListById[index],
                isVisibleAddToBasketButton: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
