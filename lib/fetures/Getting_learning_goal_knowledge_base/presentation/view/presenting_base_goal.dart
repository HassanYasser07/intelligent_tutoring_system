import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/general_widgets/app_text_buttom.dart';
import '../../../../core/routing.dart';
import '../../data/models/goal_and_knowledge_base_response_model.dart';

class PresentingBaseGoalView extends StatelessWidget {
  final LearningAnalysisResponse response;

  const PresentingBaseGoalView({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
                SizedBox(height: 30.h),
              SizedBox(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Flexible(
                      flex: 5,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFB7E67E),
                                Color(0xFF58CC02),
                              ]),
                          color: const Color(0xFF58CC02),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Text(
                          'Your\nPersonalized\nLearning Plan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Stack(
                        children: [
                          Positioned(

                            child: Image.asset(
                              'assets/icons/Add a heading(11) 1.png',
                              height: 200.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //   SizedBox(height: 10.h),
              _buildSection(
                context,
                title: 'Your Knowledge Base',
                items: response.knowledgeBase,
                icon: Icons.lightbulb_outline,
              ),


              SizedBox(height: 30.h),
              buildSection(
                context,
                title: 'What you will be learning',
                items: response.learningGoal,
                icon: Icons.check_circle_outline_sharp,
              ),
              SizedBox(height: 60.h),
              FractionallySizedBox(
                  widthFactor: 0.9,
                  child: CustomButton(
                    label: "continue",
                    onPressed: () {
                      context.push(Routes.kTopicsView, extra: response);
                    },
                    size: ButtonSize.sm,
                    variant: ButtonVariant.secondary,
                  )),
              SizedBox(height: 2.h),
              FractionallySizedBox(
                  widthFactor: 0.9,
                  child: CustomButton(
                    label: "Not right? Try again",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    size: ButtonSize.sm,
                    variant: ButtonVariant.locked,
                  )),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSection(BuildContext context,
    {required String title,
    required List<String> items,
    required IconData icon}) {
  return Container(
    padding: EdgeInsets.all(10.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: const Color(0xFF58CC02), size: 24.w),
            SizedBox(width: 5.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF58CC02),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        ...items.map((item) => Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '      •',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFF58CC02),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    ),
  );
}

Widget buildSection(BuildContext context,
    {required String title,
    required List<String> items,
    required IconData icon}) {
  return Container(
    padding: EdgeInsets.all(10.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFF58CC02), size: 24.w),
            SizedBox(width: 5.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF58CC02),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        ...items.map((item) => Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: CustomButton(
                label: item,
                onPressed: () {},
                variant: ButtonVariant.danger,
                size: ButtonSize.sm,
              ),
            )),
      ],
    ),
  );
}
