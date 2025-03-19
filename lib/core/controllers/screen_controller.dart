import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

class ScreenController extends GetxController {
  var screenWidth = 0.0.obs;
  var screenHeight = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    screenWidth.value = Get.width;
    screenHeight.value = Get.height;
  }

  void updateScreenSize() {
    screenWidth.value = Get.width;
    screenHeight.value = Get.height;
  }
}
