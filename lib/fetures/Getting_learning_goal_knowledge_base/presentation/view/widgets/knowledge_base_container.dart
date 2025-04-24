// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class KnowledgeBaseContainer extends StatelessWidget {
//   final String title;
//   final List<String> items;
//   final IconData icon;
//
//   const KnowledgeBaseContainer(
//       {super.key,
//       required this.title,
//       required this.items,
//       required this.icon});
// }
//
// @override
// Widget build(BuildContext context) {
//   return Container(
//     padding: EdgeInsets.all(10.w),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(20.r),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.5),
//           blurRadius: 10,
//           offset: const Offset(0, 4),
//         ),
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Icon(icon, color: const Color(0xFF58CC02), size: 24.w),
//             SizedBox(width: 5.w),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xFF58CC02),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 5.h),
//         ...items.map((item) => Padding(
//               padding: EdgeInsets.symmetric(vertical: 5.h),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '      •',
//                     style: TextStyle(
//                       fontSize: 16.sp,
//                       color: const Color(0xFF58CC02),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(width: 10.w),
//                   Expanded(
//                     child: Text(
//                       item,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15.sp,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )),
//       ],
//     ),
//   );
// }
