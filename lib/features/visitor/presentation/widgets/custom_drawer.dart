import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/manage_regions_page.dart';
import '../pages/visit_plan_page.dart';
import '../pages/VisitReviewPage.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.15,
            width:MediaQuery.sizeOf(context).width ,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'منو',
                    style: TextStyle(
                      color: Color(0xff6C757D),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 TextButton(onPressed:()=> Navigator.pop(context), child: Icon(Icons.close,size: 30,color: Color(0xff6C757D),)
                  )

                ],
              ),
            ),
          ),

          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.map,
                    color: Color(0xFF7D9A6D),
                  ),
                  title: Text("مدیریت نقاط فروش و مناطق بورسی"),
                  onTap: () {
                    Get.to(() => ManageRegionsPage());
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.create,
                    color: Color(0xFF7D9A6D),
                  ),
                  title: Text("ایجاد برنامه ویزیت"),
                  onTap: () {
                    Get.to(()=>VisitPlanPage());
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.list,
                    color: Color(0xFF7D9A6D),
                  ),
                  title: Text("مرور برنامه‌های ویزیت"),
                  onTap: () {
                    Get.to(()=>VisitReviewPage());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
