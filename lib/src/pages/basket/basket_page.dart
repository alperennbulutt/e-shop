import 'package:ferisoft_test_case/src/widgets/app_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({
    super.key,
  });

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
                print('pressed');
              },
              child: Icon(Icons.shopping_basket))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sepetim',
                style: TextStyle(
                    fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
              ),
            ],
          ),
// ürün özellikleri

          ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      // ürün foto
                      Column(
                        children: [Text('ürün foto')],
                      ),
                      // ürün detayları

                      Column(),
                      // arttır sil butonu
                      Column()
                    ],
                  ),

                  // ürün sloganı

                  Row(
                    children: [],
                  ),

                  // seçilen ürünlerin toplam fiyatları

                  Row(
                    children: [
                      // seçilen ürünler
                      Column(
                        children: [],
                      ),

                      // alışverişi tamamla butonu

                      ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Alışverişi Tamamla',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ))
                    ],
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
