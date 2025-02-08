import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing.dart';

class IntelligentTutoringApp extends StatelessWidget {
  const IntelligentTutoringApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // ضبط التصميم بناءً على حجم الشاشة المرجعي
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: Routes.router,

        );
      },
    );



  }
}
