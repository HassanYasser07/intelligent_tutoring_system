import 'package:flutter/material.dart';

import '../../../../core/routing.dart';

class IntelligentTutoringApp extends StatelessWidget {
  const IntelligentTutoringApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.router,

    );


  }
}
