import 'package:flutter/material.dart';

class SalesPointItem extends StatelessWidget {
  final String name;
  final String status;
  final String statusColor;

  SalesPointItem({
    required this.name,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 6),
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            /// وضعیت و آیکون وضعیت
            Row(
              children: [
                Icon(
                  statusColor == "green"
                      ? Icons.check
                      : statusColor == "orange"
                      ? Icons.access_time
                      : Icons.close,
                  color: statusColor == "green"
                      ? Colors.green
                      : statusColor == "orange"
                      ? Colors.orange
                      : Colors.red,
                ),
                SizedBox(width: 5),
                Text(
                  status,
                  style: TextStyle(
                      color: statusColor == "green"
                          ? Colors.green
                          : statusColor == "orange"
                          ? Colors.orange
                          : Colors.red),
                ),
              ],
            ),
            Spacer(),

            /// نام فروشگاه
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5),
            Icon(Icons.store, color: Colors.green[700]),
          ],
        ),
      ),
    );
  }
}
