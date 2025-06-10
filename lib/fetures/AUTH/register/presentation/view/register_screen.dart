import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/register/presentation/view/widgets/dialogs.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/register/presentation/view/widgets/register_body.dart';

import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ScrollController _scrollController = ScrollController();
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final scrollPosition = _scrollController.offset;
    final maxScroll = _scrollController.position.maxScrollExtent;

    setState(() {
      _opacity = (1.0 - scrollPosition / maxScroll).clamp(0.0, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            showSuccessDialog(context);
          // GoRouter.of(context).push(Routes.kCourseView);
          } else if (state is RegisterError) {
            setupErrorState(context, state.message);
          }
        },
        builder: (context, state) {
          return RegisterBody(
            scrollController: _scrollController,
            opacity: _opacity,
            state: state,
          );
        },
      ),
    );
  }
}
