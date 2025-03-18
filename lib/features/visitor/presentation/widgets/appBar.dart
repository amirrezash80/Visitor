import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Directionality(
    textDirection: TextDirection.ltr,
    child:
      AppBar(
      backgroundColor: Color(0xFF7D9A6D),
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'لوگو و نام',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            'شعار یا یک عبارت درباره سامانه',
            style: TextStyle(
              color: Color(0xFFF3E5AB),
              fontSize: 14,
            ),
          ),
        ],
      ),
      leadingWidth: 120,
      leading: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 18,
              child: Icon(Icons.person, color: Colors.black),
            ),
            VerticalDivider(
              color: Colors.white,
              thickness: 1,
              width: 20,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.notifications, color: Colors.white, size: 28),
                Positioned(
                  right: -5,
                  top: -5,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '۲',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('assets/profile_placeholder.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Icon(Icons.menu, color: Colors.white, size: 28),
            ],
          ),
        ),
      ],
    ),
    );
  }
}
