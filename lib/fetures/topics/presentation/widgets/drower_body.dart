import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/general_widgets/app_text_buttom.dart';
import 'package:intelligent_tutoring_system/core/routing/routing.dart';
import '../../../../core/helper/shatboot_response_storage.dart';
import 'drower_list_title_item.dart';

class DrawerBody extends StatefulWidget {
  const DrawerBody({super.key});

  @override
  State<DrawerBody> createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {




  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Text(
                "Codingo",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Pacifico',
                ),
              ),
              DrawerListTileItem(
                title: "profile",
                icon: 'assets/homeicon.svg',
                isSelected: _selectedIndex == 1,
                onTap: () {
                  context.go(Routes.kProfileView);
                },
              ),
              DrawerListTileItem(
                title: "Learning ",
                icon: 'assets/homeicon.svg',
                isSelected: _selectedIndex == 1,
                onTap: ()async{
                  final response =  await SharedPreferencesService().getLearningAnalysisResponse();

                  context.push(Routes.kTopicsView, extra: response);

                },
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            variant: ButtonVariant.dangered,
            label: 'Logout !',
            onPressed: () {},
          ),
        ),
      ],
    ),
    );


  }
}

