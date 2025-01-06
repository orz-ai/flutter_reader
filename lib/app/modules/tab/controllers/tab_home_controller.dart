import 'package:flutter/material.dart';
import '/app/routes/app_pages.dart';
import '/global.dart';
import 'package:get/get.dart';
import '../index.dart';

class TabHomeController extends GetxController {
  final state = TabState();

  PageController? pageController;

  handleNavBarTap(int index) {
    if (index == state.page) return;
    // if (Global.isOfflineLogin && index != 0) {
    //   Get.toNamed(Routes.login('tab'));
    //   return;
    // }

    // 根据页面切换更新搜索框内容
    switch (index) {
      case 0:
        searchPlaceholder.value = '搜索书籍、作者、关键词...';
        break;
      case 1:
        searchPlaceholder.value = '搜索书架内容...';
        break;
      case 2:
        searchPlaceholder.value = '搜索有声书...';
        break;
      case 3:
        searchPlaceholder.value = '搜索个人信息...';
        break;
    }

    pageController!.jumpToPage(index);
  }

  handlePageChanged(int page) {
    state.page = page;
  }

  final searchPlaceholder = '搜索书籍、作者、关键词...'.obs; // 搜索框的占位文本

  /// 打开搜索页面
  void openSearchPage(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const SearchPage(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: state.page);
  }

  @override
  void dispose() {
    pageController!.dispose();
    super.dispose();
  }
}
