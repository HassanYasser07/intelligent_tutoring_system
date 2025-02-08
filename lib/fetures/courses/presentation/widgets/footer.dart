import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.blue, size: 30),
              onPressed: () {
              },
            ),
            IconButton(
              icon: const Icon(Icons.play_lesson, color: Colors.blue, size: 30),
              onPressed: () {
              },
            ),
            SizedBox(width: 40.w), // مسافة للأيقونة العائمة
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.blue, size: 30),
              onPressed: () {
              },
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.blue, size: 30),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
