import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/VisitDetailsModal.dart';
class StoreProfilePage extends StatelessWidget {
  final Map<String, dynamic> storeDetails;

  StoreProfilePage({required this.storeDetails});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: Text(storeDetails["name"]),
        backgroundColor: Color(0xFF7D9A6D),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // **قسمت اول: اطلاعات فروشگاه**
              _buildStoreInfo(screenWidth, screenHeight),

              SizedBox(height: screenHeight * 0.02),

              // **قسمت دوم: اطلاعات ویزیت**
              _buildVisitInfo(screenWidth, screenHeight),

              SizedBox(height: screenHeight * 0.02),

              // **قسمت سوم: جدول گزارشات ویزیت**
              _buildVisitReports(),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build Store Information section with a white card
  Widget _buildStoreInfo(double screenWidth, double screenHeight) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Store Name and Location
            Text(
              storeDetails["name"] ?? "Store Name Not Provided",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(storeDetails["location"] ?? "Location Not Provided"),
            SizedBox(height: 16),

            // Store Image and Map
            Container(
              height: screenHeight * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Image.asset('assets/map_placeholder.png', fit: BoxFit.cover), // Replace with actual map or image
            ),
          ],
        ),
      ),
    );
  }

  // Function to build Visit Information section with a white card
  Widget _buildVisitInfo(double screenwidth,double screenheight) {
    return Container(
      width:screenwidth ,
    child:
      Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Visitor Info
            Text("ویزیتور: ${storeDetails['visitor'] ?? 'Not Available'}"),
            SizedBox(height: 8),
            Text("مدت ویزیت: ${storeDetails['visitDuration'] ?? '0'} ساعت و ${storeDetails['visitDuration'] ?? '0'} دقیقه"),
            SizedBox(height: 8),

            // Total Visits
            Text("تعداد دفعات ویزیت: ${storeDetails['visitCount'] ?? '0'} بار"),
          ],
        ),
      ),
    ),
    );
  }

  // Function to build Visit Reports table with a white card and horizontal scrollable DataTable
  Widget _buildVisitReports() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Visit Reports Table Title
            Text("گزارشات ویزیت", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            // Wrap DataTable with SingleChildScrollView for horizontal scrolling
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateProperty.all(Colors.grey.shade300), // Gray background for the header row
                columns: const [
                  DataColumn(label: Text('ردف')),
                  DataColumn(label: Text('وییزیتور')),
                  DataColumn(label: Text('مدت ویزیت')),
                  DataColumn(label: Text('تاریخ')),
                  DataColumn(label: Text('ساعت ')),
                  DataColumn(label: Text('گزارش ویزیتور')),
                ],
                rows: List.generate(
                  5, // You can dynamically generate this list based on your data
                      (index) {
                    return DataRow(cells: [
                      DataCell(Text((index + 1).toString())),
                      DataCell(Text("Unknown")),
                      DataCell(Text("N/A")),
                      DataCell(Text("N/A")),
                      DataCell(Text("N/A")),
                      DataCell(
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            // Open the modal with specific details
                            Get.bottomSheet(
                              VisitDetailsModal(
                                visitDetails: {
                                  "visitor": "Visitor Name",
                                  "date": "2023/12/12",
                                  "time": "15:00",
                                  "duration": "30",
                                  "description": "Description goes here",
                                },
                              ),
                              isScrollControlled: true,
                            );
                          },
                          child: Text("جزئیات", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
