import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoadingWidget extends StatelessWidget {
 final String? text;

  const LoadingWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            color: const Color(0xFF58CC02),
            'assets/icons/Add a heading(9) 1.png',
            height: 200.h,
            width: 200.w,
          ),
          Image.asset(
            'assets/icons/Loader.png',
            height: 30.h,
            width: 30.w,
          ),

          SizedBox(height: 32.h),
          Text(
            'Analyzing Your inputs...',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF58CC02),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
           text ?? '',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 32.h),
          SizedBox(
            width: 50.w,
            height: 50.w,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF58CC02)),
              strokeWidth: 4,
            ),
          ),
        ],
      ),
    );
  }
}
