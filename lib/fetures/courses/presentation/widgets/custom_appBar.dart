// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final bool showBackButton;
//   final IconData? actionIcon;
//   final VoidCallback? onActionPressed;
//
//   const CustomAppBar({
//     Key? key,
//     required this.title,
//     this.showBackButton = false,
//     this.actionIcon,
//     this.onActionPressed,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Colors.blue.shade700, Colors.blue.shade900],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             blurRadius: 5,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: showBackButton
//             ? IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         )
//             : null,
//         title: Text(
//           title,
//           style: TextStyle(
//             fontSize: 22.sp,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           if (actionIcon != null)
//             IconButton(
//               icon: Icon(actionIcon, color: Colors.white),
//               onPressed: onActionPressed,
//             ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(60.h);
// }
