import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/fetures/courses/presentation/course_view.dart';
import '../fetures/learning_style_questions/data/api_services/question_api_service.dart';
import '../fetures/learning_style_questions/presentation/logic/questions_cubit.dart';
import '../fetures/learning_style_questions/presentation/widgets/question_widgits.dart';
/// The route configuration.

abstract class Routes {
  static const courseView = '/courseView';


  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const CourseView();
        },
      ),
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const CourseView();
        },
      ),
      GoRoute(
        path: '/courseView',
        builder: (BuildContext context, GoRouterState state) {
          return  BlocProvider(
            create: (context) => QuestionCubit(QuestionsApiServices())..fetchQuestions(''), // استبدل [] بالبيانات الفعلية إذا كنت تحتاجها
            child: const QuestionWidget(),
          );
        },

      ),
    ],
  );

}