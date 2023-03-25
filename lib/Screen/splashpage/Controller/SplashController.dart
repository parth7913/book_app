import 'dart:async';

import 'package:bookapp/utils/fireHelper.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<void> HoldScreen() async {
    bool isLogin = await FireHelper.fireHelper.checkUser();
    if (isLogin) {
      Timer(
        Duration(milliseconds: 4500),
        () => Get.offNamed('home'),
      );
    } else {
      Timer(
        Duration(milliseconds: 4500),
        () => Get.offNamed('signin'),
      );
    }
  }
}
