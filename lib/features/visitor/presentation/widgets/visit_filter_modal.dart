import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/visit_filter_controller.dart';

void showVisitFilterModal(BuildContext context) {
  final VisitFilterController controller = Get.put(VisitFilterController());

  Get.bottomSheet(
    Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// **هدر مودال**
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("فیلتر و جستجو", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Get.back(),
              ),
            ],
          ),
          SizedBox(height: 10),

          /// **نوار جستجو**
          TextField(
            onChanged: (value) => controller.searchQuery.value = value,
            decoration: InputDecoration(
              hintText: "جستجو...",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(height: 15),

          /// **لیست مناطق بورسی**
          Expanded(
            child: Obx(() => ListView.builder(
              shrinkWrap: true,
              itemCount: controller.filteredRegions.length,
              itemBuilder: (context, index) {
                var province = controller.filteredRegions[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(province["province"], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Column(
                      children: (province["regions"] as List<String>).map((region) {
                        return Obx(() => CheckboxListTile(
                          title: Text(region),
                          value: controller.selectedRegions.contains(region),
                          onChanged: (bool? value) => controller.toggleRegion(region),
                        ));
                      }).toList(),
                    ),
                  ],
                );
              },
            )),
          ),

          /// **دکمه‌های تأیید و انصراف**
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.orange,
                  side: BorderSide(color: Colors.orange),
                ),
                onPressed: () => controller.clearSelection(),
                child: Text("پاک کردن انتخاب‌ها"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => Get.back(),
                child: Text("تایید"),
              ),
            ],
          ),
        ],
      ),
    ),
    isScrollControlled: true,
  );
}
