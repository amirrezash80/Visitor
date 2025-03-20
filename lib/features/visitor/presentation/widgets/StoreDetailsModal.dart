import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreDetailsModal extends StatelessWidget {
  final Map<String, dynamic> storeDetails;

  StoreDetailsModal({required this.storeDetails});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **عنوان و دکمه بستن**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  storeDetails["name"] ?? "نام فروشگاه نامشخص",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[800]),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              storeDetails["address"] ?? "آدرس مشخص نشده",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),

            SizedBox(height: 10),

            /// **نمایش زمان بازدید**
            Row(
              children: [
                Text("از ${storeDetails["startTime"] ?? '--:--'} الی ${storeDetails["endTime"] ?? '--:--'}"),
                SizedBox(width: 10),
                Text(
                  "${storeDetails["duration"] ?? 0} دقیقه",
                  style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: 15),

            /// **نمایش نقشه و مارکرها**
            Container(
              height: screenHeight * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Image.asset('assets/map_placeholder.png', fit: BoxFit.cover),
            ),

            SizedBox(height: 15),

            /// **مشخصات فروشگاه**
            _buildDetailRow("متراژ فروشگاه", storeDetails["size"]?.toString() ?? "نامشخص"),
            _buildDetailRow("آیتم برتر ویترین", storeDetails["hotItem"] ?? "نامشخص"),
            _buildDetailRow("تابلو", storeDetails["signBoard"] ?? "نامشخص"),
            _buildDetailRow("توضیحات", storeDetails["description"] ?? "توضیحی ثبت نشده", multiLine: true),

            SizedBox(height: 15),

            /// **نمایش تصاویر فروشگاه**
            Text("تابلو:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            _buildImageGallery(),
          ],
        ),
      ),
    );
  }

  /// **تابع نمایش جزئیات فروشگاه**
  Widget _buildDetailRow(String title, String value, {bool multiLine = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: multiLine ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          SizedBox(width: 100, child: Text(title, style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(child: Text(value, style: TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  /// **تابع نمایش تصاویر فروشگاه**
  Widget _buildImageGallery() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(3, (index) {
        return Container(
          width: 100,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Icon(Icons.image, size: 40, color: Colors.green[700]),
        );
      }),
    );
  }
}
