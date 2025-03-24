import 'package:fl_chart/fl_chart.dart'; // For the heatmap chart
import 'package:flutter/material.dart';

import '../widgets/base_screen.dart';

class VisitorProfilePage extends StatelessWidget {
  final Map<String, dynamic> visitorDetails;

  VisitorProfilePage({required this.visitorDetails});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return BaseScreen(
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // **قسمت اول: اطلاعات ویزیتور**
              _buildVisitorInfo(screenWidth, screenHeight),
              _buildVisitorTimeInfo(screenWidth, screenHeight),
              _buildVisitorNavInfo(screenWidth, screenHeight),
              _buildVisitorVisitNumInfo(screenWidth, screenHeight),

              SizedBox(height: screenHeight * 0.02),

              // **قسمت دوم: آمار ویزیت ها**
              _buildVisitStats(),

              SizedBox(height: screenHeight * 0.02),

              // **قسمت سوم: نمودار فعالیت ویزیتور**
              _buildVisitHeatmap(),
            ],
          ),
        ),
      ),
    );
  }

  // **Visitor Information Section**
  Widget _buildVisitorInfo(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Visitor's Avatar and Name
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      visitorDetails['avatar'] ?? 'default_avatar_url',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    visitorDetails["name"] ?? "Visitor Not Available",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Visitor Location (optional)
              Text(visitorDetails["location"] ?? "Location Not Available"),
              SizedBox(height: 16),
              Container(
                height: screenHeight * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Image.asset(
                  'assets/map_placeholder.png',
                  fit: BoxFit.cover,
                ), // Replace with actual map or image
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVisitorTimeInfo(double screenWidth, double screenHeight) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildStatsInfo(
              "بیشترین مدت زمان ویزیت",
              "${visitorDetails['totalVisitDuration']} ساعت و ${visitorDetails['totalVisitMinutes']} دقیقه",
              screenWidth,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisitorNavInfo(double screenWidth, double screenHeight) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildStatsInfo(
              "بیشترین میزان پیمایش",
              "${visitorDetails['totalVisitDuration']} ساعت و ${visitorDetails['totalVisitMinutes']} دقیقه",
              screenWidth,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisitorVisitNumInfo(double screenWidth, double screenHeight) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildStatsInfo(
              "بیشترین تعداد ویزیت در یک روز",
              "${visitorDetails['totalVisitDuration']} ساعت و ${visitorDetails['totalVisitMinutes']} دقیقه",
              screenWidth,
            ),
          ],
        ),
      ),
    );
  }

  // Function to create the stats information for each data point
  Widget _buildStatsInfo(String title, String value, double screenWidth) {
    return Container(
      width: screenWidth,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff4B6F50),
              ),
            ),
            Text(value, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  // **Visit Stats Section**
  Widget _buildVisitStats() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Visit Stats Title
            Text(
              "داشبورد",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff4B6F50),
              ),
            ),
            SizedBox(height: 10),
            // Sample Visit Time Chart or Heatmap (example chart)
            Container(height: 200, child: _buildVisitHeatmapChart()),
            Container(height: 200, child: _buildVisitHeatmap()),
          ],
        ),
      ),
    );
  }

  // **Visit Heatmap (Bar/Line Chart or any suitable type)**
  Widget _buildVisitHeatmapChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "میزان فعالیت ماهیانه بر حسب تعداد",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Expanded(
          child: BarChart(
            BarChartData(
              gridData: FlGridData(show: true),
              titlesData: FlTitlesData(show: true),
              borderData: FlBorderData(show: true),
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [BarChartRodData(toY: 8, color: Colors.blue)],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [BarChartRodData(toY: 6, color: Colors.blue)],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [BarChartRodData(toY: 5, color: Colors.blue)],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [BarChartRodData(toY: 7, color: Colors.blue)],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // **Visit Heatmap Chart Section**
  Widget _buildVisitHeatmap() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "میزان فعالیت ماهیانه بر حسب تعداد",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Expanded(
          // height: 200,
          child: RadarChart(
            RadarChartData(
              dataSets: [
                RadarDataSet(
                  fillColor: Colors.blue.withOpacity(0.4),
                  borderColor: Colors.blue,
                  borderWidth: 3,
                  dataEntries: [
                    RadarEntry(value: 0.2), // Monday
                    RadarEntry(value: 0.6), // Tuesday
                    RadarEntry(value: 0.8), // Wednesday
                    RadarEntry(value: 0.5), // Thursday
                    RadarEntry(value: 0.3), // Friday
                    RadarEntry(value: 0.7), // Saturday
                    RadarEntry(value: 1.0), // Sunday
                  ],
                ),
              ],
              ticksTextStyle: TextStyle(color: Colors.black),
              // borderData: BorderSide(color: Colors.black, width: 2),
              gridBorderData: BorderSide(color: Colors.grey, width: 1),
              titlePositionPercentageOffset: 0.2,
              titleTextStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              radarBackgroundColor: Colors.white,
              radarBorderData: BorderSide(width: 1, color: Colors.blue),
              // tickMarkData: const RadarTickMarkData(
              //   tickMarkType: TickMarkType.circle,
              //   tickMarkAlignment: Alignment.center,
              //   tickMarkLength: 6,
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
