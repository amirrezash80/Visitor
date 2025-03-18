import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/dashboard_controller.dart';
import '../widgets/appBar.dart';
import '../widgets/taskCard.dart';

class HomePage extends StatelessWidget {
  final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'کارتابل من',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Divider(),

            Expanded(
              child: Obx(() => ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: controller.tasks.length,
                itemBuilder: (context, index) {
                  final task = controller.tasks[index];
                  return TaskCard(task: task);
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
