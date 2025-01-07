import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // 适配刘海屏，将内容延伸到 AppBar 后
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(0), // 隐藏顶部默认 AppBar
        child: SafeArea(
          child: SizedBox.shrink(), // 使用 SafeArea 确保刘海屏内容不被遮挡
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
        ),
        child: ListView(
          children: [
            // 分类
            Container(
              height: 30.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 15.w),
                  _buildHeaderRoundWidget('分类', Routes.home),
                  _buildHeaderRoundWidget('榜单', Routes.home),
                  _buildHeaderRoundWidget('书单', Routes.home),
                  _buildHeaderRoundWidget('会员', Routes.home),
                  _buildHeaderRoundWidget('有声书', Routes.home),
                  _buildHeaderRoundWidget('免费', Routes.home),
                  _buildHeaderRoundWidget('新书', Routes.home),
                  _buildHeaderRoundWidget('微信读书出品', Routes.home),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            // 最近阅读情况
            SizedBox(
              height: 100.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 15.w),
                  _buildRecentReadStatisticWidget(),
                  _buildRecentBooksWidget("assets/images/books_cover/book1.png", 1),
                  _buildRecentBooksWidget("assets/images/books_cover/book2.png", 1),
                  _buildRecentBooksWidget("assets/images/books_cover/book3.png", 1),
                  _buildRecentBooksWidget("assets/images/books_cover/book4.png", 1),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // 大家都在看
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('大家都在看', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),



                ],
              ),
            ),

            SizedBox(height: 10.h),



          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRoundWidget(String label, String path) {
    return InkWell(
      onTap: () {
        Get.toNamed(path);
      },
      child: Container(
        constraints: BoxConstraints(minWidth: 40.w, minHeight: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(label, style: TextStyle(fontSize: 10.sp)),
            Icon(
              CupertinoIcons.chevron_right,
              color: Colors.grey,
              size: 10.sp,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRecentReadStatisticWidget() {
    return Container(
      height: 100.h,
      width: 120.w,
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }

  /// 最近阅读
  /// @param cover 封面
  /// @param bookType 书籍类型 1:书籍 2:听书
  Widget _buildRecentBooksWidget(String cover, int bookType) {
    return Container(
      height: 100.h,
      width: 60.w,
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(image: AssetImage(cover), fit: BoxFit.scaleDown),
      ),
    );
  }
}
