import 'package:ferisoft_test_case/src/pages/home/home_page.dart';
import 'package:ferisoft_test_case/src/pages/my_app.dart';
import 'package:get/route_manager.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    // home page
    GetPage(
      name: Routes.INITIAL,
      //! this const part should be remove when page dynamic values
      page: () => MyApp(),
    )
  ];
}
