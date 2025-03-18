
import 'package:flutter/material.dart';

Widget buildLocationButton(String location) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Color(0xFFE6EDDD),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Text(
        location,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
