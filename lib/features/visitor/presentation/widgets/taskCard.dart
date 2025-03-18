import 'package:flutter/material.dart';
import '../../domain/entities/task.dart';
import '../pages/Region.dart';
import 'package:get/get.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  TaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF3EAE0),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('تاریخ: ${task.date}', style: TextStyle(color: Color(0xff6C757D))),
            Text('منطقه بورسی: ${task.location}', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('وضعیت: ${task.status}', style: TextStyle(color: task.statusColor == "orange" ? Colors.orange : task.statusColor == "red" ? Colors.red : Colors.green)),
            if (task.isButtonVisible)
              ElevatedButton(
                onPressed: () {
                  Get.to(() => RegionPage());
                },
                child: Text(task.buttonText ?? ""),
              ),
          ],
        ),
      ),
    );
  }
}
