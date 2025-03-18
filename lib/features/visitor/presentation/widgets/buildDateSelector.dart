import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sepanta/features/visitor/presentation/getx/dashboard_controller.dart';

Widget buildDateSelector() {
  final HomeController controller = Get.put(HomeController());

  return Obx(
        () => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        Text(controller.selectedDate.value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: () {},
        ),
      ],
    ),
  );
}
