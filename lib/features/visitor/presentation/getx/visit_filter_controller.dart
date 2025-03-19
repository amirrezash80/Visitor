import 'package:get/get.dart';

class VisitFilterController extends GetxController {
  var searchQuery = "".obs;
  var selectedRegions = <String>[].obs;

  List<Map<String, dynamic>> allRegions = [
    {"province": "اصفهان", "regions": ["چهارباغ عباسی", "سپه", "جلفا", "آزادی"]},
    {"province": "تهران", "regions": ["بنی‌هاشم", "پاسداران", "تجریش", "سعادت‌آباد", "خیابان شریعتی", "فرمانیه", "ولیعصر"]},
  ];

  /// **فیلتر کردن بر اساس جستجو**
  List<Map<String, dynamic>> get filteredRegions {
    if (searchQuery.isEmpty) return allRegions;
    return allRegions.map((province) {
      var filteredList = province["regions"]
          .where((region) => region.contains(searchQuery.value))
          .toList();
      return {"province": province["province"], "regions": filteredList};
    }).where((province) => province["regions"].isNotEmpty).toList();
  }

  /// **انتخاب یا حذف منطقه**
  void toggleRegion(String region) {
    selectedRegions.contains(region)
        ? selectedRegions.remove(region)
        : selectedRegions.add(region);
  }

  /// **پاک کردن انتخاب‌ها**
  void clearSelection() {
    selectedRegions.clear();
  }
}
