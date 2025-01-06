import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../widget/second_tap_exit_app.dart';
import '../../personal/views/personal_view.dart';
import '/app/modules/home/index.dart';
import '../index.dart';

class TabHomePage extends StatefulWidget {
  const TabHomePage({Key? key}) : super(key: key);

  @override
  State<TabHomePage> createState() => TabHomePageState();
}

class TabHomePageState extends State<TabHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  TabHomeController get controller => Get.find();

  /// 内容页
  Widget _buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      children: const <Widget>[
        HomePage(),
        // GlobalPurchasingPage(),
        // ClassifyPage(),
        PersonalPage(),
      ],
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
    );
  }

  /// 底部导航
  Widget _buildBottomNavigationBar() {
    List<BottomNavigationBarItem> _bottomItems = _createBottomItems();
    return Obx(
      () => BottomNavigationBar(
        items: _bottomItems,
        currentIndex: controller.state.page,
        backgroundColor: const Color(0xFFFFFEFF),
        unselectedItemColor: const Color(0xFF828489),
        selectedItemColor: Colors.blueAccent,
        type: BottomNavigationBarType.fixed,
        onTap: controller.handleNavBarTap,
        selectedFontSize: 8.sp,
        unselectedFontSize: 8.sp,
        iconSize: 21.w,
      ),
    );
  }

  List<BottomNavigationBarItem> _createBottomItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.book_outlined,
          color: Colors.grey,
        ),
        activeIcon: const Icon(
          Icons.book,
          color: Colors.blueAccent,
        ),
        label: '阅读'.tr,
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.shelves,
          color: Colors.grey,
        ),
        activeIcon: const Icon(
          Icons.shelves,
          color: Colors.blueAccent,
        ),
        label: '书架'.tr,
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.headphones_outlined,
          color: Colors.black87,
        ),
        activeIcon: const Icon(
          Icons.headphones,
          color: Colors.blueAccent,
        ),
        label: '有声书'.tr,
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.person_outline,
          color: Colors.grey,
        ),
        activeIcon: const Icon(
          Icons.person,
          color: Colors.blueAccent,
        ),
        label: '我'.tr,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SecondTapExitAppWidget(
      child: Scaffold(
        body: _buildPageView(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }
}
