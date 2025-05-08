import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginLogo extends StatelessWidget {
  const LoginLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.05.sh, // screen height * 0.05
      left: 0,
      right: 0,
      child: Column(
        children: [
          SizedBox(
            width: 0.5.sw, // 50% من عرض الشاشة
            height: 0.5.sw,
            child: Image.asset('assets/duo.png', fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
