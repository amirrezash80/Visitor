import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:sepanta/core/theme/appColor.dart';
class PersianDatePicker extends StatelessWidget {
  final String label;
  final RxString selectedDate;

  PersianDatePicker({required this.label, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Obx(() => GestureDetector(
          onTap: () async {
            Jalali? picked = await showPersianDatePicker(
              context: context,
              initialDate: Jalali.now(),
              firstDate: Jalali(1385, 8),
              lastDate: Jalali(1450, 9),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: AppColors.darkGreen,
                    // datePickerTheme: DatePickerThemeData(
                    //   dayBackgroundColor: MaterialStateProperty.all(Colors.green),
                    //
                    // )// Override primary color
                    // Add more customization here
                  ),
                  child: child!,
                );
              },
            );

            if (picked != null) {
              selectedDate.value = "${picked.year}/${picked.month}/${picked.day}";
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedDate.value, style: TextStyle(fontSize: 16)),
                Icon(Icons.calendar_today, color: Colors.green),
              ],
            ),
          ),
        )),
        SizedBox(height: 10),
      ],
    );
  }
}
