import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_tutoring_system/fetures/profile/presentation/cubit/profile_cubit.dart';
import 'package:intelligent_tutoring_system/fetures/profile/presentation/view/widgets/profile_content.dart';

import '../../../topics/presentation/widgets/costom_menu_drower.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomMenuDrawer(),
      onDrawerChanged: (isOpened) {
      },
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded) {
            return ProfileContent(profile: state.profile, scaffoldKey: _scaffoldKey,);
          } else if (state is ProfileError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text("No Data"));
        },
      ),
    );
  }
}
