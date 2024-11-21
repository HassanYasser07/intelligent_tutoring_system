import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../fetures/learning_style_questions/data/api_services/question_api_service.dart';
import '../fetures/learning_style_questions/presentation/logic/questions_cubit.dart';
import '../fetures/learning_style_questions/presentation/widgets/question_widgits.dart';
import '../fetures/learning_style_questions/qqqqqqqq.dart';

/// The route configuration.

abstract class Routes {
  static const qqqqqqqqqqq = '/qqqqqqqqq';


  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return  BlocProvider(
            create: (context) => QuestionCubit(QuestionsApiServices())..fetchQuestions(''), // استبدل [] بالبيانات الفعلية إذا كنت تحتاجها
            child: QuestionWidget(),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: qqqqqqqqqqq,
            builder: (BuildContext context, GoRouterState state) {
              return const Qqqqqqqq();
            },
          ),
        ],
      ),
    ],
  );

}