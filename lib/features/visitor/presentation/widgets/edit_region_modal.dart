import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditRegionModal extends StatefulWidget {
  final Map<String, dynamic> region;

  EditRegionModal({required this.region});

  @override
  _EditRegionModalState createState() => _EditRegionModalState();
}

class _EditRegionModalState extends State<EditRegionModal> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool selectFromMap = true; // کنترل نمایش گزینه‌های انتخاب از روی نقشه یا آپلود اکسل

  @override
  void initState() {
    super.initState();
    nameController.text = widget.region["name"];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **هدر مودال**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("افزودن/ویرایش منطقه بورسی",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            SizedBox(height: 10),

            /// **انتخاب روش تعیین نقاط**
            /// **انتخاب روش تعیین نقاط**
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("روش انتخاب نقاط", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),

                /// گزینه انتخاب از روی نقشه
                Row(
                  children: [
                    Radio<bool>(
                      value: true,
                      groupValue: selectFromMap,
                      onChanged: (value) {
                        setState(() {
                          selectFromMap = value!;
                        });
                      },
                    ),
                    Text("انتخاب نقاط از روی نقشه"),
                  ],
                ),

                /// گزینه بارگذاری فایل اکسل
                Row(
                  children: [
                    Radio<bool>(
                      value: false,
                      groupValue: selectFromMap,
                      onChanged: (value) {
                        setState(() {
                          selectFromMap = value!;
                        });
                      },
                    ),
                    Text("بارگذاری فایل اکسل نقاط"),
                  ],
                ),
              ],
            ),


            /// **فیلد نام منطقه بورسی**
            Text("نام منطقه بورسی",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "نام منطقه را وارد کنید...",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            /// **بخش نمایش لیست نقاط یا آپلود فایل**
            selectFromMap ? _buildSelectedPointsList() : _buildExcelUpload(),

            SizedBox(height: 15),

            /// **نمایش نقشه**
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Image.asset('assets/map_placeholder.png', fit: BoxFit.cover),
            ),

            SizedBox(height: 10),

            /// **فیلدهای نام مکان و آدرس**
            Text("نام مکان", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            Text("آدرس", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.edit, color: Colors.orange),
              ),
            ),

            SizedBox(height: 10),

            /// **دکمه‌های تایید و انصراف**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  ),
                  onPressed: () {
                    print("Region updated!");
                    Navigator.of(context).pop();
                  },
                  child: Text("تایید", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.green),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("انصراف", style: TextStyle(color: Colors.green)),
                ),
              ],
            ),

            SizedBox(height: 10),

            /// **پیغام راهنما**
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

            /// **دکمه ثبت منطقه بورسی**
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6D7D58),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  print("Region registered!");
                },
                child: Text("ثبت منطقه بورسی", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **نمایش لیست نقاط انتخاب‌شده**
  Widget _buildSelectedPointsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("لیست نقاط انتخاب شده (۸)", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Column(
          children: [
            _buildSalesPointItem("فروشگاه کریمی"),
            _buildSalesPointItem("فروشگاه مدرن"),
            _buildSalesPointItem("فروشگاه الکترونسل"),
            _buildSalesPointItem("فروشگاه شهروند"),
            _buildSalesPointItem("فروشگاه تکنولایف"),
            _buildSalesPointItem("فروشگاه الکترونیکی"),
          ],
        ),
      ],
    );
  }

  /// **آیتم لیست نقاط فروش**
  Widget _buildSalesPointItem(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.store, color: Colors.green),
            SizedBox(width: 5),
            Text(name),
          ],
        ),
        Row(
          children: [
            IconButton(icon: Icon(Icons.edit, color: Colors.orange), onPressed: () {}),
            IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: () {}),
          ],
        ),
      ],
    );
  }

  /// **بخش بارگذاری فایل اکسل**
  Widget _buildExcelUpload() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("بارگذاری فایل اکسل", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.upload_file, color: Colors.blue),
              SizedBox(width: 10),
              Text("انتخاب فایل", style: TextStyle(color: Colors.blue)),
            ],
          ),
        ),
      ],
    );
  }
}
