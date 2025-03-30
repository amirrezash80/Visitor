import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/region_controller.dart';
import '../widgets/add_sales_point_modal.dart';
import '../widgets/base_screen.dart';
import '../widgets/sales_point_item.dart';

class RegionPage extends StatelessWidget {
  final RegionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Icon(Icons.map, size: 50, color: Colors.green[800]),
                      SizedBox(height: 10),
                      Obx(
                        () => Text(
                          controller.regionName.value,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          controller.regionAddress.value,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 15),

                      /// **Map Display**
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Image.asset(
                          'assets/map_placeholder.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    top: 4,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "نقاط فروش",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      /// **Sales Points List**
                      Obx(
                        () => Column(
                          children:
                              controller.salesPoints.map((point) {
                                return SalesPointItem(
                                  name: point["name"] ?? "",
                                  status: point["status"] ?? "",
                                  statusColor: point["statusColor"] ?? "",
                                );
                              }).toList(),
                        ),
                      ),

                      SizedBox(height: 10),

                      /// **Add New Sales Point Button**
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.orange,
                          side: BorderSide(color: Colors.orange),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
