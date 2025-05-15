import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/general_widgets/app_text_buttom.dart';
import 'package:intelligent_tutoring_system/core/general_widgets/loading_widget.dart';
import 'package:intelligent_tutoring_system/fetures/Getting_learning_goal_knowledge_base/presentation/view/widgets/chatbot_text_form_field.dart';
import 'package:intelligent_tutoring_system/fetures/Getting_learning_goal_knowledge_base/presentation/view/widgets/text.dart';
import '../../data/models/goal_and_knowledge_base_response_model.dart';
import '../cubit/shat_boot_cubit.dart';
import '../cubit/shat_boot_state.dart';
import '../../../../core/routing/routing.dart';

class ShatBootView extends StatelessWidget {
  final _knowledgeController = TextEditingController();
  final _goalController = TextEditingController();

  ShatBootView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<LearningAnalysisCubit, LearningAnalysisState>(
          listener: (context, state) {
            if (state is LearningAnalysisError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
            if (state is LearningAnalysisSuccess) {
              final response = LearningAnalysisResponse(
                knowledgeBase: state.knowledgeBase,
                learningGoal: state.learningGoal,
              );
              context.push(Routes.kPresentingBaseGoalView, extra: response);
            }
          },
          builder: (context, state) {
            if (state is LearningAnalysisLoading) {
              return const LoadingWidget(text:'Creating your personalized learning path',);
            }
      
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFB7E67E),
                    Color(0xFF58CC02),
                    Color(0xFF58CC02),
                    Color(0xFF58CC02),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16).w,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        'Let’s customize your \n learning path!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                       Padding(
                        padding: EdgeInsets.only(
                          left: 140.w,
                          top: 60.h,
                          bottom: 40.h,
                        ),
                        child: const Text('Tell us what you know &\n where you wanna go',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF),
                        )),
                      ),
      
      
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,

                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              bottom: MediaQuery.of(context).size.height * 0.38,
                              child: Image.asset(
                                'assets/icons/kareem.png',
                                height: 280.h,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                              child: Column(
                                children: [
                                  const Spacer(),
                                const TextWidget(question: ' "What do you already know?"'),
                                  SizedBox(height: 12.h),
                                  ChatbotTextFormField(hintText: 'E.g. I know Python... (it\'s okay to leave blank)',controller: _knowledgeController,),
                                  const Spacer(),
                                  SizedBox(height: 24.h),
                                 const TextWidget(question:    "What's your tech goal?"),
                                  SizedBox(height: 12.h),
                                  ChatbotTextFormField(hintText: 'E.g. I want to build backend websites)',controller: _goalController,),
                                  const Spacer(),


                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomButton(
                        size: ButtonSize.large,
                        label: 'ANALYZE!',
                        variant: ButtonVariant.super_,
                        onPressed: () {
                          context.read<LearningAnalysisCubit>().analyzeLearning(
                                _knowledgeController.text,
                                _goalController.text,
                              );
                        },
                      ),
                    //  const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
