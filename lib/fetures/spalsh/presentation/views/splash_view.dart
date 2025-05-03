
import 'package:flutter/material.dart';
import 'package:intelligent_tutoring_system/fetures/spalsh/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key, required Future<void> Function() onInit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SplashViewBody(),
    );
  }
}
