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
      body: Stack(
        children: [
          // 主页面内容
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                // 搜索框
                GestureDetector(
                  onTap: () {
                    // 显示搜索页面
                    Get.find<HomeController>().toggleSearch();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 10.h),
                    padding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 5.w),
                        Text('搜索书籍、作者、关键词...',
                            style: TextStyle(
                                color: Colors.grey, fontSize: 14.sp)),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                // Banner 区域
                Container(
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner.jpg'), // 替换为你的图片路径
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                // 推荐书籍标题
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('推荐书籍',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: () {
                        // 跳转到更多推荐页面
                        // Get.toNamed(Routes.recommend);
                      },
                      child: Text('查看更多',
                          style:
                          TextStyle(fontSize: 14.sp, color: Colors.blue)),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                // 推荐书籍列表
                Expanded(
                  child: ListView.builder(
                    itemCount: 5, // 假设有5本推荐书籍
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          width: 50.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/book_${index + 1}.jpg'), // 替换为你的图片路径
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text('书名 ${index + 1}',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold)),
                        subtitle: Text('作者 ${index + 1}',
                            style:
                            TextStyle(fontSize: 14.sp, color: Colors.grey)),
                        onTap: () {
                          // 跳转到书籍详情页
                          // Get.toNamed(Routes.bookDetail, arguments: {'id': index + 1});
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // 搜索页面覆盖
          Obx(() {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 100), // 设置渐变过渡时间
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: Get.find<HomeController>().isSearching.value
                  ? GestureDetector(
                key: const ValueKey('searchPage'), // 唯一键值，确保 AnimatedSwitcher 正确识别
                onTap: () {
                  // 隐藏搜索页面
                  Get.find<HomeController>().toggleSearch();
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                Get.find<HomeController>().toggleSearch();
                              },
                            ),
                            Expanded(
                              child: TextField(
                                autofocus: true,
                                decoration: const InputDecoration(
                                  hintText: '搜索书籍、作者、关键词...',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Expanded(
                        child: Center(
                          child: Text('搜索结果区域'),
                        ),
                      ),
                    ],
                  ),
                ),
              )
                  : const SizedBox.shrink(
                key: ValueKey('mainPage'), // 唯一键值
              ),
            );
          })
        ],
      ),
    );
  }
}
