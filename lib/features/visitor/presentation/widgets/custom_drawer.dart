import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// **Header Section**
          Container(
            color: Color(0xFF7D9A6D),
            padding: EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "منو",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          /// **Menu Items**
          buildDrawerItem(Icons.store, "مدیریت نقاط فروش و مناطق بورسی", () {}),
          buildDrawerItem(Icons.assignment, "ایجاد برنامه ویزیت", () {}),
          buildDrawerItem(Icons.history, "مرور برنامه‌های ویزیت", () {}),
        ],
      ),
    );
  }

  /// **Helper function to create drawer items**
  Widget buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF4B6F50)),
      title: Text(title, style: TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}
