import 'package:flutter/material.dart';

class VisitDetailsModal extends StatelessWidget {
  final Map<String, dynamic> visitDetails;

  VisitDetailsModal({required this.visitDetails});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
      color: Colors.white,
      height: MediaQuery.sizeOf(context).height * 0.6,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("جزئیات گزارش ویزیتور", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close_outlined, color: Colors.grey),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              // Title with Visitor Name

            ],
          ),
          // Close button (cross button at the top right corner)
          SizedBox(height: 10),

          // Divider between visit details and other information
          Divider(color: Colors.grey.shade300),

          SizedBox(height: 10),

          // Additional information
          Text("اطلاعات وارد شده:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text("متراژ مغازه: ${visitDetails['shopArea'] ?? 'N/A'} متر", style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          Text("متراژ انبار: ${visitDetails['storageArea'] ?? 'N/A'} متر", style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          Text("زمینه فعالیت: ${visitDetails['activityArea'] ?? 'N/A'}", style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          Text("تابلو: ${visitDetails['signboard'] ?? 'N/A'}", style: TextStyle(fontSize: 16)),

          SizedBox(height: 20),

          // Images or other details (e.g., store photos)
          Text("تصاویر:", style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          _buildImageGallery(),  // Add images or placeholders here

          // Close button at the bottom
          Spacer(),
        ],
      ),
    );
  }

  // Function to build image gallery (for example, images of the store)
  Widget _buildImageGallery() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(3, (index) {
        return Container(
          width: 100,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Icon(Icons.image, size: 40, color: Colors.green[700]), // Placeholder for images
        );
      }),
    );
  }
}
