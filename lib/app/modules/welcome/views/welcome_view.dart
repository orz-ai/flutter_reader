import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routes/app_pages.dart';
import '../index.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: ListView(
              children: [
                // button
                Container(
                  margin: EdgeInsets.only(top: 100.h),
                  child: ElevatedButton(
                    child: Text('跳转到首页'),
                    onPressed: () => Get.toNamed(Routes.home), // 跳转到首页
                  ),
                ),
                // button
                Container(
                  margin: EdgeInsets.only(top: 100.h),
                  child: ElevatedButton(
                    child: Text('跳转到登录页'),
                    onPressed: () => Get.toNamed(Routes.login("")), // 跳转到登录页
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
