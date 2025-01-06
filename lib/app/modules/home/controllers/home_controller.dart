import 'package:get/get.dart';

import '../../../base/controller/base_controller.dart';
import '../index.dart';

class HomeController extends BaseController<HomeModel> {
  HomeController(HomeModel model) : super(model);
  var isSearching = false.obs;

  void toggleSearch() {
    isSearching.value = !isSearching.value;
  }
}
