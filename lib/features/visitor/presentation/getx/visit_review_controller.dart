import 'package:get/get.dart';

class VisitReviewController extends GetxController {
  var selectedDate = "1403/03/04".obs;
  var selectedVisitor = "حامد نصری‌نژاد".obs;

  var visits = [
    {"name": "فروشگاه کریمی", "duration": 15, "status": "ویزیت شده"},
    {"name": "فروشگاه مدرن", "duration": 15, "status": "عدم ویزیت"},
    {"name": "فروشگاه اسلامی", "duration": 15, "status": "ویزیت شده"},
    {"name": "فروشگاه حکیمی", "duration": 15, "status": "ویزیت شده"},
    {"name": "توقف", "duration": 25, "status": "توقف"},
    {"name": "فروشگاه شاداب", "duration": 15, "status": "ویزیت شده"},
  ].obs;
}
