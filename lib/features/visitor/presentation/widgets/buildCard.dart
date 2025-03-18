import 'package:flutter/material.dart';


Widget buildCard(String location, String status, Color statusColor,
    {bool isButtonVisible = false}) {
  return Card(
    color: Color(0xFFF5F2EA),
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('منطقه بررسی: $location',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text('وضعیت شروع شده: ', style: TextStyle(fontSize: 14)),
          Text(status, style: TextStyle(color: statusColor)),
          if (isButtonVisible) ...[
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6D7D58),
              ),
              onPressed: () {},
              child: Text('شروع', style: TextStyle(color: Colors.white)),
            )
          ]
        ],
      ),
    ),
  );
}
