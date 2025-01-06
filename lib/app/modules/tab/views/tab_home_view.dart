import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../home/views/home_view.dart';
import '../../personal/views/personal_view.dart';
import '../index.dart';

class TabHomePage extends StatefulWidget {
  const TabHomePage({Key? key}) : super(key: key);

  @override
  State<TabHomePage> createState() => TabHomePageState();
}

class TabHomePageState extends State<TabHomePage> {
  RefreshController _refreshController1 = RefreshController();
  RefreshController _refreshController2 = RefreshController();
  int _tabIndex = 0;

  @override
  void initState() {
    _refreshController1.headerMode?.addListener(() {
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshController1.position?.jumpTo(0);
      setState(() {});
    });
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
    return RefreshConfiguration(
      enableScrollWhenTwoLevel: true,
      maxOverScrollExtent: 120,
      child: Scaffold(
        body: Stack(
          children: [
            Offstage(
              offstage: _tabIndex != 0,
              child: LayoutBuilder(
                builder: (_, c) {
                  return SmartRefresher(
                    header: TwoLevelHeader(
                      textStyle: const TextStyle(color: Colors.black87),
                      displayAlignment: TwoLevelDisplayAlignment.fromTop,
                      twoLevelWidget: TwoLevelWidget(),
                    ),
                    controller: _refreshController1,
                    enableTwoLevel: true,
                    enablePullDown: true,
                    enablePullUp: true,
                    onLoading: () async {
                      await Future.delayed(Duration(milliseconds: 1000));
                      _refreshController1.loadComplete();
                    },
                    onRefresh: () async {
                      await Future.delayed(Duration(milliseconds: 1000));
                      _refreshController1.refreshCompleted();
                    },
                    child: CustomScrollView(
                      physics: const ClampingScrollPhysics(),
                      slivers: <Widget>[
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: c.maxHeight,
                            child: Scaffold(
                              appBar: AppBar(
                                backgroundColor: Colors.white,
                                elevation: 0, // 去除阴影
                                title: Obx(() {
                                  return GestureDetector(
                                    onTap: () => controller.openSearchPage(context),
                                    child: AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 100),
                                      child: Container(
                                        height: 30.h,
                                        key: ValueKey(controller.searchPlaceholder.value),
                                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius: BorderRadius.circular(20.r),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.search, color: Colors.grey, size: 16,),
                                            SizedBox(width: 5.w),
                                            Expanded(
                                              child: Text(
                                                controller.searchPlaceholder.value,
                                                style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              body: _buildPageView(),
                              bottomNavigationBar: !_refreshController1.isTwoLevel ? _buildBottomNavigationBar() : null,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Offstage(
              offstage: _tabIndex != 1,
              child: SmartRefresher(
                header: const ClassicHeader(),
                controller: _refreshController2,
                enableTwoLevel: true,
                onRefresh: () async {
                  await Future.delayed(const Duration(milliseconds: 2000));
                  _refreshController2.refreshCompleted();
                },
                onTwoLevel: (bool isOpen) {
                  print(isOpen);
                  if (isOpen) {
                    _refreshController2.position?.hold(() {});
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (c) => Scaffold(
                                  appBar: AppBar(
                                    title: Text("二楼"),
                                  ),
                                  body: Text("二楼刷新"),
                                )))
                        .whenComplete(() {
                      _refreshController2.twoLevelComplete(duration: const Duration(microseconds: 1));
                    });
                  }
                },
                child: CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Container(
                        color: Colors.red,
                        height: 680.0,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("点击这里返回上一页!"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// 搜索页面
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('搜索', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Text(
          '这里是搜索页面',
          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
        ),
      ),
    );
  }
}

class TwoLevelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("二楼"),
    );
  }
}
