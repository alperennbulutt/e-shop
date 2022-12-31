import 'package:ferisoft_test_case/src/controller/basket/basket_controller.dart';
import 'package:ferisoft_test_case/src/controller/categories/categories_controller.dart';
import 'package:ferisoft_test_case/src/controller/home/home_conttoller.dart';
import 'package:ferisoft_test_case/src/controller/login/login_controller.dart';
import 'package:ferisoft_test_case/src/controller/products/products_controller.dart';
import 'package:ferisoft_test_case/src/data/repository/repository.dart';
import 'package:ferisoft_test_case/src/data/services/api.dart';
import 'package:ferisoft_test_case/src/pages/basket/basket_page.dart';
import 'package:ferisoft_test_case/src/pages/product/product_page.dart';
import 'package:ferisoft_test_case/src/widgets/app_title_widget.dart';
import 'package:ferisoft_test_case/src/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final categoriesController = Get.put(
      CategoriesController(repository: MyRepository(apiClient: MyApiClient())));

  final productsController = Get.put(
      ProductsController(repository: MyRepository(apiClient: MyApiClient())));

  final basketController = Get.put(BasketController());
  final controller = Get.put(
      HomeController(repository: MyRepository(apiClient: MyApiClient())));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: CustomAppTitle(
          loginAppBarColor: Color.fromARGB(255, 255, 255, 255),
        ),
        backgroundColor: Colors.orange,
        actions: [
          InkWell(
              onTap: () {
                Get.to(BasketPage());
              },
              child: Icon(Icons.shopping_basket))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // categories
            Container(
              width: Get.width,
              height: Get.height * 0.05,
              decoration: BoxDecoration(color: Colors.orange),
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesController.categoriesNameList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print('pressed:' + index.toString());
                        controller.isSelectedCategory.value = true;
                        productsController.selectedProductId.value = index + 1;
                        productsController.getProductByCategoryId();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          categoriesController.categoriesNameList[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Obx(
              () => Visibility(
                visible: !controller.isSelectedCategory.value,
                child: Container(
                  width: Get.width * 0.8,
                  height: Get.height * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ŞOK İNDİRİMLERİ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'KAÇIRMAYIN !',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => Visibility(
                visible: !controller.isSelectedCategory.value,
                child: Text(
                  'Çok Satanlar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            Obx(
              () => Visibility(
                visible: !controller.isSelectedCategory.value,
                child: Container(
                  width: Get.width,
                  height: ((productsController.productNameList.length) / 2) *
                      Get.height *
                      0.32,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: productsController.productNameList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print('pressed');
                        },
                        child: ProductCustomCardWidget(
                          image: productsController.productPhotoList[index],
                          name: productsController.productNameList[index],
                          price: productsController.productPriceList[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            Obx(
              () => Visibility(
                  visible: controller.isSelectedCategory.value,
                  child: productsController.productsByIdLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : ProductPage()),
            )
          ],
        ),
      ),
    );
  }
}
