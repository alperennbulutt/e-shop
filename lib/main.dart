import 'package:ferisoft_test_case/src/pages/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'src/routes/app_pages.dart';

main() async {
  await GetStorage.init();

  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      home: MyApp()));
}
