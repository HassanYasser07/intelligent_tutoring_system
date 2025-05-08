import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Codingo',
      style: TextStyle(
        fontSize: 48.sp,
        fontWeight: FontWeight.w900,
        color: Colors.green,
      ),
    );
  }
}
