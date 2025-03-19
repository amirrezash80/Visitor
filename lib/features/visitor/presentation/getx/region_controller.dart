import 'package:get/get.dart';

class RegionController extends GetxController {
  var regionName = "منطقه بورسی بنی‌هاشم".obs;
  var regionAddress = "تهران، خیابان بنی‌هاشم".obs;

  /// ✅ List of sales points for the selected region
  var selectedRegionSalesPoints = <String>[].obs;

  /// ✅ All sales points with their visit status
  var salesPoints = <Map<String, String>>[
    {"name": "فروشگاه کریمی", "status": "ویزیت شده", "statusColor": "green"},
    {"name": "فروشگاه مدرن", "status": "در حال ویزیت", "statusColor": "orange"},
    {"name": "فروشگاه الکترونسل", "status": "ویزیت نشده", "statusColor": "red"},
    {"name": "فروشگاه شهروند", "status": "ویزیت نشده", "statusColor": "red"},
    {"name": "فروشگاه تکنولایف", "status": "ویزیت نشده", "statusColor": "red"},
  ].obs;

  /// ✅ List of all regions with their sales points
  var regions = <Map<String, dynamic>>[
    {
      "name": "خیابان جمهوری",
      "salesPoints": ["فروشگاه کریمی", "فروشگاه مدرن"]
    },
    {
      "name": "بنی‌هاشم",
      "salesPoints": ["فروشگاه الکترونسل", "فروشگاه شهروند", "فروشگاه تکنولایف"]
    },
    {
      "name": "خیابان ولیعصر",
      "salesPoints": []
    },
    {
      "name": "فردوسی",
      "salesPoints": []
    },
    {
      "name": "بازار بزرگ تهران",
      "salesPoints": []
    },
    {
      "name": "خیابان مطهری",
      "salesPoints": []
    }
  ].obs;

  var filteredRegions = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredRegions.assignAll(regions);
  }

  /// ✅ Search regions based on query
  void searchRegion(String query) {
    if (query.isEmpty) {
      filteredRegions.assignAll(regions);
    } else {
      filteredRegions.assignAll(regions.where((region) {
        String regionName = region["name"] as String;
        List<String> points = List<String>.from(region["salesPoints"] ?? []);

        return regionName.contains(query) ||
            points.any((point) => point.contains(query));
      }).toList());
    }
  }

  /// ✅ View a region and update `selectedRegionSalesPoints`
  void viewRegion(Map<String, dynamic> region) {
    regionName.value = region["name"] as String;
    selectedRegionSalesPoints.assignAll(List<String>.from(region["salesPoints"] ?? []));
  }

  void editRegion(Map<String, dynamic> region) {
    print("Editing: ${region['name']}");
  }

  void exportToExcel() {
    print("Exporting to Excel...");
  }
}
