import 'package:get/get.dart';

class RegionController extends GetxController {
  var regionName = "منطقه بورسی بنی‌هاشم".obs;
  var regionAddress = "تهران، خیابان بنی‌هاشم".obs;

  var salesPoints = [
    {"name": "فروشگاه کریمی", "status": "ویزیت شده", "statusColor": "green"},
    {"name": "فروشگاه مدرن", "status": "در حال ویزیت", "statusColor": "orange"},
    {"name": "فروشگاه الکترونسل", "status": "ویزیت نشده", "statusColor": "red"},
    {"name": "فروشگاه شهروند", "status": "ویزیت نشده", "statusColor": "red"},
    {"name": "فروشگاه تکنولایف", "status": "ویزیت نشده", "statusColor": "red"},
  ].obs;
}
