import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intelligent_tutoring_system/fetures/courses/presentation/widgets/custom_appBar.dart';
import 'package:intelligent_tutoring_system/fetures/courses/presentation/widgets/footer.dart';

class CourseViewBody extends StatelessWidget {
  const CourseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Courses',  showBackButton: true,
          actionIcon: Icons.search,
          onActionPressed: () {

          },),

        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // عدد الأعمدة
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: 14,
                itemBuilder: (context, index) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 12.h,),
                            const Text(
                              'Front End',
                              style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),

                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Button color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.r),
                                ),
                              ),
                              onPressed: () {
                                print("Button Clicked");
                              },
                              child: Text(
                                "Enroll Now",
                                style: TextStyle(color: Colors.blue, fontSize: 15.sp),
                              ),
                            ),
                            const Spacer(),
                            Image.asset('assets/Course.PNG', height: 80.h,),
                            SizedBox(height: 3.h,)
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right:- 20,
                        child: Icon(Icons.question_mark, color: Colors.yellow, size: 55,),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      const Footer()
      ],
    );
  }
}

