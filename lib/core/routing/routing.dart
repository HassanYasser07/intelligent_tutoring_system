import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/networking/token_service.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/login/data/loginRepo/login_repo.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/login/presentation/cubit/login_cubit.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/register/data/repository/register_repository.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/register/presentation/cubit/register_cubit.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/register/presentation/view/register_screen.dart';
import 'package:intelligent_tutoring_system/fetures/Los/vedio/los_view.dart';
import 'package:intelligent_tutoring_system/fetures/learning_style_questions/presentation/result_view.dart';
import 'package:intelligent_tutoring_system/fetures/learning_style_questions/presentation/widgets/question_widgits.dart';
import 'package:intelligent_tutoring_system/fetures/presentingLos/data/api_services/los_api_services.dart';
import 'package:intelligent_tutoring_system/fetures/presentingLos/data/repo/los_repo.dart';
import 'package:intelligent_tutoring_system/fetures/presentingLos/presentation/cubit/los_cubit.dart';
import 'package:intelligent_tutoring_system/fetures/presentingLos/presentation/view/los_view.dart';
import 'package:intelligent_tutoring_system/fetures/profile/data/repo/profile_repo.dart';
import 'package:intelligent_tutoring_system/fetures/profile/presentation/cubit/profile_cubit.dart';
import 'package:intelligent_tutoring_system/fetures/profile/presentation/view/learned_topics_viev.dart';
import 'package:intelligent_tutoring_system/fetures/profile/presentation/view/profile%20view.dart';
import 'package:intelligent_tutoring_system/fetures/spalsh/presentation/views/splash_view.dart';
import 'package:intelligent_tutoring_system/fetures/topics/data/api_services/user_knowledge_api_services.dart'
    show UserKnowledgeApiServices;
import 'package:intelligent_tutoring_system/fetures/topics/presentation/cubit/user_knowledge_cubit.dart'
    show UserKnowledgeCubit;
import 'package:intelligent_tutoring_system/fetures/topics/presentation/series_of_topics.dart';
import 'package:intelligent_tutoring_system/fetures/welcome/presentation/view/welcome_screen.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../fetures/AUTH/login/presentation/login_view.dart';
import '../../fetures/Getting_learning_goal_knowledge_base/data/api_services/api_services.dart';
import '../../fetures/Getting_learning_goal_knowledge_base/data/models/goal_and_knowledge_base_response_model.dart';
import '../../fetures/Getting_learning_goal_knowledge_base/data/repo/goal_and _knowledge_base_repo.dart';
import '../../fetures/Getting_learning_goal_knowledge_base/presentation/cubit/shat_boot_cubit.dart';
import '../../fetures/Getting_learning_goal_knowledge_base/presentation/view/presenting_base_goal.dart';
import '../../fetures/Getting_learning_goal_knowledge_base/presentation/view/shat_boot_view.dart';
import '../../fetures/profile/data/apiServices/profile_api_services.dart';
import '../../fetures/success/presentation/course_view.dart';
import '../helper/shatboot_response_storage.dart';
import '../helper/token_storage.dart';

/// The route configuration.

class Routes {
  static const kRegisterView = '/registerView';
  static const kLoginView = '/loginView';
  static const kCourseView = '/courseView';
  static const kLessonView = '/lessonView';
  static const kLosView = '/LosView';
  static const kTopicsView = '/TopicsView';
  static const kLearningStyleQuestionsView = '/LearningStyleQuestionsView';
  static const kShatBootView = '/ShatBootView';
  static const kWelcomeScreen = '/welcomeScreen';
  static const kResultView = '/result';
  static const kPresentingBaseGoalView = '/presentingBaseGoalView';
  static const kProfileView = '/profileView';
  static const kAllTopicsView = '/AllTopicsView';

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return SplashView(
            onInit: () async {
              try {
                final token = await AppStorage.getToken();
                if (token == null) {
                  return context.go(kWelcomeScreen);
                }
                // Verify token
                final tokenService = TokenService();
                await tokenService.verifyToken(token);

                //  Check for saved LearningAnalysisResponse
                // final prefs = await SharedPreferences.getInstance();
                final prefsService = SharedPreferencesService();
                final savedResponse =
                    await prefsService.getLearningAnalysisResponse();
                // Token is valid
                if (savedResponse != null) {
                  return context.go(Routes.kTopicsView, extra: savedResponse);
                } else {
                  return context.go(Routes.kCourseView);
                }
              } on UnauthorizedException {
                // Token is invalid or expired
                await AppStorage.deleteToken(); // Clear invalid token
                return context.go(kLoginView);
              } catch (e) {
                // Handle other errors
                return context.go(kLoginView);
              }
            },
          );
        },
      ),
      GoRoute(
        path: kShatBootView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => LearningAnalysisCubit(
                GoalAndKnowledgeBaseRepo(ApiServices(Dio()))),
            child: ShatBootView(),
          );
        },
      ),
      GoRoute(
        path: kLoginView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => LoginCubit(LoginRepository(Dio())),
            child: LoginView(),
          );
        },
      ),
      GoRoute(
        path: kRegisterView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => RegisterCubit(RegisterRepository(Dio())),
            child: const RegisterScreen(),
          );
        },
      ),
      GoRoute(
        path: kLosView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => LOsCubit(LORepository(LOApiService(Dio()))),
            child: const LOsView(
              loId: 1,
              name: "",
            ),
          );
        },
      ),
      GoRoute(
        path: kTopicsView, // make sure you use the correct path constant
        builder: (BuildContext context, GoRouterState state) {
          final analysisResponse = state.extra as LearningAnalysisResponse;
          return FutureBuilder<SharedPreferences>(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }
              return BlocProvider(
                create: (context) => UserKnowledgeCubit(
                  UserKnowledgeApiServices(Dio()),
                  snapshot.data!,
                ),
                child: UserPathScreen(
                  analysisResponse: analysisResponse,
                ),
              );
            },
          );
        },
      ),
      GoRoute(
        path: kCourseView,
        builder: (BuildContext context, GoRouterState state) {
          return const SuccessScreen();
        },
      ),
      GoRoute(
        path: kLosView,
        builder: (BuildContext context, GoRouterState state) {
          return const VideoLessonPage();
        },
      ),
      GoRoute(
        path: kWelcomeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomeScreen();
        },
      ),
      GoRoute(
        path: kLearningStyleQuestionsView,
        builder: (BuildContext context, GoRouterState state) {
          return const QuestionWidget();
        },
      ),
      GoRoute(
        path: kPresentingBaseGoalView,
        builder: (BuildContext context, GoRouterState state) {
          return PresentingBaseGoalView(
            response: state.extra as LearningAnalysisResponse,
          );
        },
      ),
      GoRoute(
        path: kResultView,
        builder: (BuildContext context, GoRouterState state) {
          final results = state.extra as Map<String, dynamic>;
          return ResultView(results: results);
        },
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) {
          return FutureBuilder(
            future: AppStorage.getToken(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Scaffold(
                    body: Center(child: Text("Not logged in")));
              }
              final email = JwtDecoder.decode(snapshot.data!)['email'];
              return BlocProvider(
                create: (_) => ProfileCubit(
                  ProfileRepo(
                    ProfileApiService(Dio()),
                  ),
                )..getProfile(email),
                child: const ProfileScreen(),
              );
            },
          );
        },
      ),
      GoRoute(
        path: kAllTopicsView,
        builder: (BuildContext context, GoRouterState state) {
          return const LearnedTopicsView();
        },
      ),
    ],
  );
}
