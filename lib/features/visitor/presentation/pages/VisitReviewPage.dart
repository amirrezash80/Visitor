import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import '../getx/visit_review_controller.dart';
import '../widgets/base_screen.dart';
import '../widgets/persian_date_picker.dart';
import '../widgets/StoreDetailsModal.dart';

class VisitReviewPage extends StatelessWidget {
  final VisitReviewController controller = Get.put(VisitReviewController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return BaseScreen(
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("مرور ویزیت‌ها", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: screenHeight * 0.02),

            /// **فیلترهای جستجو**
            _buildFilters(),

            SizedBox(height: screenHeight * 0.02),

            /// **لیست مسیر ویزیت‌ها**
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.visits.length,
                itemBuilder: (context, index) {
                  final visit = controller.visits[index];
                  return _buildVisitTimelineItem(visit, screenWidth, screenHeight);
                },
              ),
              ),
            ),

            /// **دکمه خروجی اکسل**
            _buildExportButton(screenWidth),
          ],
        ),
      ),
    );
  }

  /// **فیلتر تاریخ و ویزیتور**
  Widget _buildFilters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PersianDatePicker(
          label: "تاریخ",
          selectedDate: controller.selectedDate,
        ),
        SizedBox(height: 10),
        _buildDropdown("ویزیتور", controller.selectedVisitor, ["حامد نصری‌نژاد", "میلاد شمایی"]),
      ],
    );
  }

  /// **لیست کشویی فیلتر‌ها**
  Widget _buildDropdown(String label, RxString selectedValue, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Obx(() => DropdownButtonFormField<String>(
          value: selectedValue.value,
          items: options.map((option) {
            return DropdownMenuItem(value: option, child: Text(option));
          }).toList(),
          onChanged: (value) => selectedValue.value = value!,
          decoration: InputDecoration(border: OutlineInputBorder()),
        )),
        SizedBox(height: 10),
      ],
    );
  }

  /// **نمایش هر آیتم تایم‌لاین ویزیت**
  Widget _buildVisitTimelineItem(Map<String, dynamic> visit, double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        if (visit.isNotEmpty) {
          Get.bottomSheet(
            StoreDetailsModal(storeDetails: visit),
            isScrollControlled: true,
          );
        } else {
          print("❌ اطلاعات فروشگاه نامعتبر است!");
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(Icons.circle, color: Colors.grey, size: 12),
              Container(width: 2, height: screenHeight * 0.13, color: Colors.grey),
            ],
          ),
          SizedBox(width: 10),

          Expanded(
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: visit["status"] == "عدم ویزیت"
                    ? Colors.red.shade100
                    : visit["status"] == "توقف"
                    ? Colors.orange.shade100
                    : Colors.green.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    visit["name"],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  if (visit["status"] == "عدم ویزیت")
                    Text("عدم ویزیت", style: TextStyle(color: Colors.red, fontSize: 14)),
                  if (visit["status"] != "عدم ویزیت")
                    Text("${visit["duration"]} دقیقه", style: TextStyle(fontSize: 14, color: Colors.orange)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.chevron_left, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// **دکمه خروجی اکسل**
  Widget _buildExportButton(double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.5,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          side: BorderSide(color: Colors.green),
        ),
        onPressed: () {
          print("exel export");
        },
        icon: Icon(Icons.download),
        label: Text("خروجی اکسل"),
      ),
    );
  }
}
