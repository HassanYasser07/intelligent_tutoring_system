import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/helper/token_storage.dart';
import 'package:intelligent_tutoring_system/fetures/spalsh/presentation/views/widgets/slidind_text.dart';
import '../../../../../core/helper/shatboot_response_storage.dart';
import '../../../../../core/routing/routing.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  static const kTransitionDuration = Duration(milliseconds: 1500);

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/duolingo.gif', width: 100, height: 100,),
        SlidingText(slidingAnimation: slidingAnimation)

      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
        vsync: this,
        duration: kTransitionDuration);
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: const Offset(0, 0))
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    final token = await AppStorage.getToken();
    if (token == null) {
      context.go(Routes.kWelcomeScreen);
    } else {
      // Token is valid, now check for saved LearningAnalysisResponse
      final prefsService = SharedPreferencesService();
      final savedResponse = await prefsService.getLearningAnalysisResponse();

      // If there is a saved response, navigate to TopicsView with the saved data
      if (savedResponse != null) {
        context.go(Routes.kTopicsView, extra: savedResponse);
      }

      else {
        context.go(Routes.kCourseView);
      }
    }
  }
}

