import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intelligent_tutoring_system/core/general_widgets/custom_appBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Getting_learning_goal_knowledge_base/data/models/goal_and_knowledge_base_response_model.dart';
import '../data/models/user_path_response_model.dart';
import 'cubit/user_knowledge_cubit.dart';
import 'cubit/user_knowledge_states.dart';
import 'widgets/costom_menu_drower.dart';
import 'widgets/list_view_item.dart';

class UserPathScreen extends StatefulWidget {
  final LearningAnalysisResponse analysisResponse;

  const UserPathScreen({
    super.key,
    required this.analysisResponse,
  });

  @override
  State<UserPathScreen> createState() => _UserPathScreenState();
}

class _UserPathScreenState extends State<UserPathScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();




  @override
  void initState() {
    super.initState();
    _checkCachedUserKnowledge();
  }

  void _checkCachedUserKnowledge() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('cached_learning_objects');

    if (cachedData != null) {
      // لو موجود بيانات كاشد
      final Map<String, dynamic> decodedJson = jsonDecode(cachedData);
      final cachedResponse = UserPathResponseModel.fromJson(decodedJson);

      // مررها لحالة النجاح مباشرة
      context.read<UserKnowledgeCubit>().emit(UserKnowledgeSuccess(cachedResponse));
    } else {

      _fetchUserKnowledge();
    }
  }

  void _fetchUserKnowledge() {
    context.read<UserKnowledgeCubit>().getBestPath(widget.analysisResponse);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomMenuDrawer(),
      onDrawerChanged: (isOpened) {
      },
      appBar:CustomAppBar(
        title: 'Learning Path',
        showBackButton: false,
        toggleDrawer:  () => _scaffoldKey.currentState?.openDrawer(),
      ),
    body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<UserKnowledgeCubit, UserKnowledgeState>(
            builder: (context, state) {
              if (state is UserKnowledgeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is UserKnowledgeError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error: ${state.message}',
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<UserKnowledgeCubit>().getBestPath(widget.analysisResponse);
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );}
              if (state is UserKnowledgeSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF58CC02),
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [

                          Container(
                            padding: EdgeInsets.all(25.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFF58CC02),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                bottomLeft: Radius.circular(16.r),
                              ),
                            ),
                            child: Icon(
                              Icons.menu_book_outlined,
                              color: Colors.white,
                              size: 24.w,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your journey to learn',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                widget.analysisResponse.learningGoal.join(', '),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.response.learningObjects.length,
                        itemBuilder: (context, index) {
                          final learningObject = state.response.learningObjects[index];
                          return  LearningObjectItem(
                            learningObject: learningObject,
                            index: index,
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              // Initial state
              return const Center(
                child: CircularProgressIndicator(),
              );
             //   YourPlanReady(onPressed: (){context.read<UserKnowledgeCubit>().getBestPath(analysisResponse);},);
            },
          ),
        ),
      ),
    );
  }
}

