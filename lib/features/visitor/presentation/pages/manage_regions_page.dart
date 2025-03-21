import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/region_controller.dart';
import '../widgets/base_screen.dart';
import '../widgets/edit_region_modal.dart';
import '../pages/StoreProfilePage.dart';

class ManageRegionsPage extends StatelessWidget {
  final RegionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "مدیریت نقاط فروش و مناطق بورسی",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            /// **Search Bar**
            TextField(
              decoration: InputDecoration(
                hintText: "جستجو در مناطق بورسی و فروشگاه‌ها...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              ),
              onChanged: (query) {
                controller.searchRegion(query);
              },
            ),

            SizedBox(height: 15),

            /// **List of Regions & Sales Points**
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.filteredRegions.length,
                itemBuilder: (context, index) {
                  final region = controller.filteredRegions[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(region["name"]),  // Correct reference
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.access_time, color: Colors.green),
                              onPressed: () {
                                controller.viewRegion(region);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.orange),
                              onPressed: () {
                                _showEditRegionModal(context, region);
                              },
                            ),
                          ],
                        ),
                      ),
                      if (region["salesPoints"] != null)
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            children: region["salesPoints"].map<Widget>((store) {
                              return ListTile(
                                title: Text(store),
                                leading: Icon(Icons.store, color: Colors.green),
                                onTap: () {
                                  // Navigate to store profile page
                                  _showStoreProfile(context, {
                                    'name': store,
                                    'location': "Tehran, BN district",  // Add the correct location
                                    'visitor': 'Sasan Nowruz Zadeh',
                                    'visitDuration': 15,
                                    'visitCount': 5,
                                    'description': "Store description here",
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  );
                },
              )),
            ),

            SizedBox(height: 10),

            /// **Export Button**
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green,
                  side: BorderSide(color: Colors.green),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  controller.exportToExcel();
                },
                icon: Icon(Icons.download),
                label: Text("خروجی اکسل"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to open the modal for editing region
  void _showEditRegionModal(BuildContext context, Map<String, dynamic> region) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return EditRegionModal(region: region); // Use the modal widget here
      },
      isScrollControlled: true,
    );
  }

  // Function to show the store profile modal
  void _showStoreProfile(BuildContext context, Map<String, dynamic> store) {
    print(store);
    Get.to(() => StoreProfilePage(storeDetails: store));
  }
}
