import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/general_widgets/custom_appBar.dart';
import '../../../../core/routing/routing.dart';
class LessonViewBody extends StatelessWidget {
  const LessonViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Lessons',showBackButton: true,),

        Expanded(child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12).w,
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.heart_broken, color: Colors.white, size: 30.sp),
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10),
                            backgroundColor:   Colors.green.shade400, // لون الزر
                            foregroundColor: Colors.red,  // لون التأثير عند الضغط
                          ),
                        ),
                        Positioned(
                          bottom:- 15.sp, // تحكم في الموقع العلوي
                          // تحكم في الموقع الأفقي
                          child: Container(

                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Colors.black87,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "59", // الرقم أو النص فوق الزر
                              style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.high_quality, color: Colors.white, size: 30.sp),
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10),
                            backgroundColor: Colors.green.shade400, // لون الزر
                            foregroundColor: Colors.red,  // لون التأثير عند الضغط
                          ),
                        ),
                        Positioned(
                          bottom:- 15.sp, // تحكم في الموقع العلوي
                          // تحكم في الموقع الأفقي
                          child: Container(

                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Colors.black87,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "5%", // الرقم أو النص فوق الزر
                              style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],

                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // عدد الأعمدة
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        GoRouter.of(context).push(Routes.kTopicsView);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            alignment: Alignment.center,
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.golf_course_rounded, color: Colors.green.shade400, size: 50,),
                                Text(
                                  'Lesson 1:OOP',
                                  style: TextStyle(color: Colors.black87, fontSize: 16,fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
        )))
    )
      ],
    );
  }
  }