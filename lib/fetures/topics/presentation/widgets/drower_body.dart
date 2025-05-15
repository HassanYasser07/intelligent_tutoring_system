import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/general_widgets/app_text_buttom.dart';
import 'package:intelligent_tutoring_system/core/routing/routing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/helper/shatboot_response_storage.dart';
import '../../../../core/helper/token_storage.dart';
import 'drower_list_title_item.dart';

class DrawerBody extends StatefulWidget {
  const DrawerBody({super.key});

  @override
  State<DrawerBody> createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  void _clearCachedUserKnowledge() async {
    final prefs = await SharedPreferences.getInstance();
    final success = await prefs.remove('cached_learning_objects');
    if (success) {
      print('✅ Cached user knowledge data deleted.');
    } else {
      print('⚠️ No data to delete.');
    }
  }

  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              // SizedBox(
              //   height: 200.h,
              //   width: 200.w,
              //   child: Image.asset(
              //    fit: BoxFit.contain, // أو try contain
              //
              //     "assets/IMG_7279.PNG", ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  children: [
                    // SizedBox(
                    //   height: 10.h,),
                    SizedBox(
                      height: 75.h,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          "assets/IMG_7283.PNG",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80.h,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          "assets/IMG_7284.PNG",
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              DrawerListTileItem(
                title: "profile",
                icon: 'assets/IMG_7289.svg',
                isSelected: _selectedIndex == 1,
                onTap: () {
                  context.go(Routes.kProfileView);
                },
              ),
              DrawerListTileItem(
                title: "Know Your Style",
                icon: 'assets/IMG_7290.svg',
                isSelected: _selectedIndex == 1,
                onTap: () {
                  GoRouter.of(context)
                      .push(Routes.kLearningStyleExplanationView);
                },
              ),
              DrawerListTileItem(
                title: "Learning ",
                icon: 'assets/IMG_7291.svg',
                isSelected: _selectedIndex == 1,
                onTap: () async {
                  final response = await SharedPreferencesService()
                      .getLearningAnalysisResponse();
                  //  context.push(Routes.kTopicsView, extra: response);
                  GoRouter.of(context)
                      .push(Routes.kTopicsView, extra: response);
                },
              ),
              //
              DrawerListTileItem(
                title: "Plan Your Learning ",
                icon: 'assets/Applicationpolicy.svg',
                isSelected: _selectedIndex == 1,
                onTap: () async {
                  _clearCachedUserKnowledge();
                  GoRouter.of(context).push(Routes.kShatBootView);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            icon: Icons.logout,
            variant: ButtonVariant.dangered,
            label: 'Logout !',
            onPressed: () async {
              await AppStorage.deleteToken();
              GoRouter.of(context).pushReplacement(Routes.kLoginView);
            },
          ),
        ),
      ],
    );
  }
}
