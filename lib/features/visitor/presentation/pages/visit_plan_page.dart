import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/visit_plan_controller.dart';
import '../widgets/base_screen.dart';
import '../widgets/visit_filter_modal.dart';
import '../widgets/persian_date_picker.dart';

class VisitPlanPage extends StatelessWidget {
  final VisitPlanController controller = Get.put(VisitPlanController());

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
            /// **فیلترهای جستجو**
            _buildFilters(screenWidth, screenHeight),

            SizedBox(height: screenHeight * 0.02),

            /// **تقویم و روزهای هفته**
            _buildCalendar(),

            SizedBox(height: screenHeight * 0.02),

            /// **لیست برنامه ویزیت**
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.visitPlans.length,
                itemBuilder: (context, index) {
                  final visit = controller.visitPlans[index];
                  return _buildVisitCard(visit, screenWidth, screenHeight);
                },
              )),
            ),
          ],
        ),
      ),
    );
  }

  /// **ساخت فیلتر‌های جستجو**
  Widget _buildFilters(double screenWidth, double screenHeight) {
    return Column(
      children: [
        PersianDatePicker(
          label: "تاریخ",
          selectedDate: controller.selectedDate,
        ),        _buildDropdown("استان", controller.selectedProvince, ["تهران", "مشهد"]),
        _buildDropdown("انتخاب منطقه بورسی", controller.selectedRegion, ["بنی‌هاشم", "تجریش", "ولیعصر"]),
        _buildDropdown("ویزیتور", controller.selectedVisitor, ["حامد نصری‌نژاد", "میلاد شمایی"]),
        SizedBox(height: screenHeight * 0.02),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green,
                  side: BorderSide(color: Colors.green),
                ),
                onPressed: controller.submitVisitPlan,
                child: Text("ثبت"),
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.orange,
                  side: BorderSide(color: Colors.orange),
                ),
                onPressed: controller.uploadExcelFile,
                icon: Icon(Icons.upload_file),
                label: Text("بارگذاری فایل اکسل"),
              ),
            ),
          ],
        ),
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

  /// **ساخت تقویم و روزهای هفته**
  Widget _buildCalendar() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFECE1D6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.arrow_back_ios),
          Text("شنبه 03/12", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Icon(Icons.arrow_forward_ios),
          /// **دکمه فیلتر**
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.green),
            onPressed: () => showVisitFilterModal(Get.context!),
          ),

        ],
      ),
    );
  }

  /// **ساخت کارت ویزیتور**
  Widget _buildVisitCard(Map<String, String> visit, double screenWidth, double screenHeight) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      color: Color(0xFFE6EDDD),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(visit["avatar"]!),
              radius: screenWidth * 0.08,
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(visit["province"]!, style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text(visit["name"]!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(visit["region"]!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: visit["region"] == "تعیین نشده" ? Colors.red : Colors.black)),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit, color: Colors.orange),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

