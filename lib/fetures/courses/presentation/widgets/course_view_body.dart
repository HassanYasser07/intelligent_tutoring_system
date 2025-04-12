import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/general%20widgets/custom_appBar.dart';
import 'package:intelligent_tutoring_system/fetures/courses/presentation/widgets/footer.dart';
import '../../../../core/routing.dart';
import '../drower_content_view.dart';

class CourseViewBody extends StatefulWidget {
  const CourseViewBody({super.key});

  @override
  State<CourseViewBody> createState() => _CourseViewBodyState();
}

class _CourseViewBodyState extends State<CourseViewBody> {
  bool isDrawerOpen = false;

  void toggleDrawer() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: 'Courses',
              showBackButton: false,
              actionIcon: Icons.search,
              onActionPressed:(){GoRouter.of(context).push(Routes.kLearningStyleQuestionsView);},
              toggleDrawer:toggleDrawer ,
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Personalize Courses',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'make for you',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // عدد الأعمدة
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                      //  mainAxisExtent: 160
                    ),
                    itemCount: 14,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade300),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey.shade300),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  color: Colors.white,
                                ),
                                child: SvgPicture.asset('assets/mysql.svg', height: 50,)),
                            const SizedBox(height: 10),
                            Text(
                              'Flutter',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const Footer()
          ],
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          left: isDrawerOpen ? 0 : -250, // التحكم في إظهار القائمة
          top: 0,
          bottom: 0,
          child: SizedBox(
            width: 250,
            child: DrawerContent(onClose: toggleDrawer),
          ),
        ),

        // إغلاق القائمة عند الضغط خارجها
        if (isDrawerOpen)
          Positioned(
            left: 250, // يبدأ من نهاية القائمة الجانبية
            top: 0,
            bottom: 0,
            right: 0, // يغطي فقط المنطقة المتبقية من الشاشة
            child: GestureDetector(
              onTap: toggleDrawer,
              child: Container(
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
      ]

    );
  }
}











// Stack(
// clipBehavior: Clip.none,
// children: [
// Container(
// decoration: BoxDecoration(
// color: Colors.blue,
// borderRadius: BorderRadius.circular(10.r),
// ),
// alignment: Alignment.center,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// SizedBox(height: 12.h,),
// const Text(
// 'Front End',
// style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
//
// ),
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// backgroundColor: Colors.white, // Button color
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(14.r),
// ),
// ),
// onPressed: () {
// GoRouter.of(context).push(Routes.kLessonView);
// },
// child: Text(
// "Enroll Now",
// style: TextStyle(color: Colors.blue, fontSize: 15.sp),
// ),
// ),
// const Spacer(),
// Image.asset('assets/Course.PNG', height: 80.h,),
// SizedBox(height: 3.h,)
// ],
// ),
// ),
// Positioned(
// bottom: 5,
// right:- 20,
// child: Icon(Icons.question_mark, color: Colors.yellow, size: 55,),
// ),
// ],
// );