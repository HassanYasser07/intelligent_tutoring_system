import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/routing.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../core/helper/token_storage.dart';
import '../../../profile/presentation/cubit/profile_cubit.dart';
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
    return ListView(
      children: [
        DrawerListTileItem(
          title: "profile",
          icon: 'assets/homeDark.svg',
          isSelected: _selectedIndex == 1,
          onTap: () {
            context.go(Routes.kProfileView);
          },
        ),
      ],
    );
  }
}

