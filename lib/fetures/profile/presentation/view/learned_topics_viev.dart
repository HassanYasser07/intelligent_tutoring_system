// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LearnedTopicsView extends StatefulWidget {
//   const LearnedTopicsView({super.key});
//
//   @override
//   State<LearnedTopicsView> createState() => _AllTopicsScreenState();
// }
//
// class _AllTopicsScreenState extends State<LearnedTopicsView> {
//   List<String> allTopics = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadAllTopics();
//   }
//
//   Future<void> _loadAllTopics() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       allTopics = prefs.getStringList('saved_strings_list') ?? [];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFb7e67e), Color(0xFF58cc02)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Header
//                 Center(
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 120.h,
//                         width: 120.w,
//                         child: Image.asset('assets/6.png'), // Your app image
//                       ),
//                       SizedBox(height: 12.h),
//                       Text(
//                         'Learned Topics',
//                         style: TextStyle(
//                           fontSize: 28.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 SizedBox(height: 24.h),
//
//                 // Topics List
//                 Expanded(
//                   child: GridView.builder(
//                     itemCount: allTopics.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
//                       crossAxisSpacing: 16.w,
//                       mainAxisSpacing: 16.h,
//                       childAspectRatio: 3,
//                     ),
//                     itemBuilder: (context, index) {
//                       return Container(
//                         padding: EdgeInsets.symmetric(horizontal: 12.w),
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.9),
//                           borderRadius: BorderRadius.circular(20.r),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.black12,
//                                blurRadius: 6,
//                               offset: Offset(2, 2),
//                             ),
//                           ],
//                         ),
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           allTopics[index],
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intelligent_tutoring_system/fetures/profile/presentation/view/widgets/learned_topics_grid.dart';
import 'package:intelligent_tutoring_system/fetures/profile/presentation/view/widgets/learned_topics_header.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LearnedTopicsView extends StatefulWidget {
  const LearnedTopicsView({super.key});

  @override
  State<LearnedTopicsView> createState() => _LearnedTopicsViewState();
}

class _LearnedTopicsViewState extends State<LearnedTopicsView> {
  List<String> allTopics = [];

  @override
  void initState() {
    super.initState();
    _loadAllTopics();
  }

  Future<void> _loadAllTopics() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      allTopics = prefs.getStringList('saved_strings_list') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFb7e67e), Color(0xFF58cc02)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                const TopicsHeader(),
                SizedBox(height: 24.h),
                Expanded(child: TopicsGrid(topics: allTopics)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
