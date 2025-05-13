import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopicsHeader extends StatelessWidget {
  const TopicsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 120.h,
            width: 120.w,
            child: Image.asset('assets/6.png'),
          ),
          SizedBox(height: 12.h),
          Text(
            'Learned Topics',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
