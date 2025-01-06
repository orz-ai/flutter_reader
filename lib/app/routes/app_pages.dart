import 'package:flutter_reader/app/modules/home/index.dart';
import 'package:flutter_reader/app/modules/tab/index.dart';
import 'package:get/get.dart';

import '../middleware/router_login.dart';
import '../modules/login/index.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.initial;

  static final List<GetPage> routes = [
    GetPage(
      name: _Paths.initial,
      page: () => const TabHomePage(),
      binding: TabHomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
      middlewares: [
        RouteLoginMiddleware(priority: 0),
      ],
    ),
  ];
}
