import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/region_controller.dart';
import '../widgets/sales_point_item.dart';
import '../widgets/add_sales_point_modal.dart';
import '../widgets/base_screen.dart';

class RegionPage extends StatelessWidget {
  final RegionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return BaseScreen( // ✅ Use BaseScreen instead of Scaffold
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.map, size: 50, color: Colors.green[800]),
            SizedBox(height: 10),
            Obx(() => Text(
              controller.regionName.value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Obx(() => Text(
              controller.regionAddress.value,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            )),
            SizedBox(height: 15),

            /// **Map Display**
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Image.asset('assets/map_placeholder.png', fit: BoxFit.cover),
            ),

            SizedBox(height: 20),
            Divider(),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "نقاط فروش",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),

            /// **Sales Points List**
            Obx(() => Column(
              children: controller.salesPoints.map((point) {
                return SalesPointItem(
                  name: point["name"]!,
                  status: point["status"]!,
                  statusColor: point["statusColor"]!,
                );
              }).toList(),
            )),

            SizedBox(height: 10),

            /// **Add New Sales Point Button**
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.orange,
                side: BorderSide(color: Colors.orange),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                showAddSalesPointModal(context);
              },
              icon: Icon(Icons.add),
              label: Text("افزودن نقطه فروش جدید"),
            ),
          ],
        ),
      ),
    );
  }
}
