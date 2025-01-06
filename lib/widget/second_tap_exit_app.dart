import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'toast.dart';

/// 再按一次退出程序
class SecondTapExitAppWidget extends StatefulWidget {
  final Widget child;

  const SecondTapExitAppWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _SecondTapExitAppWidgetState createState() => _SecondTapExitAppWidgetState();
}

class _SecondTapExitAppWidgetState extends State<SecondTapExitAppWidget> {
  DateTime? _lastPopTime; // 上次点击时间

  @override
  Widget build(BuildContext context) {
    // 如果不是 Android 平台，则直接返回子组件
    if (!Platform.isAndroid) {
      return widget.child;
    }

    return WillPopScope(
      onWillPop: () async {
        if (_lastPopTime == null ||
            DateTime.now().difference(_lastPopTime!) > const Duration(seconds: 2)) {
          // 两次点击间隔超过 2 秒则重新计时
          _lastPopTime = DateTime.now();
          toastInfo(msg: "exit_app".tr);
          return false; // 阻止返回
        }
        return true; // 允许退出
      },
      child: widget.child,
    );
  }
}
