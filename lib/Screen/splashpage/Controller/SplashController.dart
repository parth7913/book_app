import 'dart:async';

import 'package:bookapp/utils/fireHelper.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  Future<void> HoldScreen() async {
    bool isLogin = await FireHelper.fireHelper.checkUser();
    if (isLogin) {
      Timer(Duration(seconds: 4), () => Get.offNamed('home'));
    } else {
      Timer(Duration(seconds: 4), () => Get.offNamed('signin'));
    }
  }
}
