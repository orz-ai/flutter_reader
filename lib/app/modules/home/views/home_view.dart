import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: [
            SizedBox(height: 20.h),
            // Banner 区域
            Container(
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                // image: const DecorationImage(
                //   image: AssetImage('assets/images/banner.jpg'), // 替换为你的图片路径
                //   fit: BoxFit.cover,
                // ),
              ),
            ),

            SizedBox(height: 20.h),

            // 推荐书籍标题
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('大家都在看', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              ],
            ),

            SizedBox(height: 10.h),

            // 推荐书籍列表

          ],
        ),
      ),
    );
  }

}
