import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showAddSalesPointModal(BuildContext context) {
  Get.bottomSheet(
    Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// **Close Button**
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("افزودن نقطه فروش", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Get.back(),
              ),
            ],
          ),
          SizedBox(height: 10),

          /// **Map Placeholder**
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Image.asset('assets/map_placeholder.png', fit: BoxFit.cover),
          ),

          SizedBox(height: 15),

          /// **Sales Point Name**
          Text("نام نقطه فروش", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              hintText: "فروشگاه آریا",
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            ),
          ),

          SizedBox(height: 10),

          /// **Address**
          Text("آدرس", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              hintText: "بنی‌هاشم، رحیمی",
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              suffixIcon: Icon(Icons.edit, color: Colors.orange),
            ),
          ),

          SizedBox(height: 10),

          /// **Info Message**
          Row(
            children: [
              Icon(Icons.info_outline, color: Colors.orange, size: 18),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                  "نقطه فروش مد نظر خود را روی نقشه یا قرار دادن پرچم روی آن نقاط مشخص کنید.",
                  style: TextStyle(fontSize: 12, color: Colors.orange),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),

          /// **Submit Button**
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6D7D58),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {
                // Logic to save the sales point
              },
              child: Text("ثبت نقطه فروش", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    ),
    isScrollControlled: true,
  );
}
