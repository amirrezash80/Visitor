import 'package:get/get.dart';

class VisitPlanController extends GetxController {
  var selectedDate = "1403/03/04".obs;
  var selectedProvince = "تهران".obs;
  var selectedRegion = "بنی‌هاشم".obs;
  var selectedVisitor = "حامد نصری‌نژاد".obs;

  var visitPlans = [
    {"name": "حامد نصری‌نژاد", "region": "بنی‌هاشم", "province": "تهران", "avatar": "assets/avatar1.png"},
    {"name": "میلاد شمایی", "region": "تعیین نشده", "province": "تهران", "avatar": "assets/avatar2.png"},
    {"name": "علی مرتضوی", "region": "تجریش", "province": "تهران", "avatar": "assets/avatar3.png"},
    {"name": "جواد ملکی", "region": "ولیعصر", "province": "تهران", "avatar": "assets/avatar4.png"},
    {"name": "ساسان نوروز زاده", "region": "تعیین نشده", "province": "تهران", "avatar": "assets/avatar5.png"},
  ].obs;

  void changeDate(String date) {
    selectedDate.value = date;
  }

  void changeProvince(String province) {
    selectedProvince.value = province;
  }

  void changeRegion(String region) {
    selectedRegion.value = region;
  }

  void changeVisitor(String visitor) {
    selectedVisitor.value = visitor;
  }

  void uploadExcelFile() {
    print("Uploading Excel File...");
  }

  void submitVisitPlan() {
    print("Submitting visit plan...");
  }
}
