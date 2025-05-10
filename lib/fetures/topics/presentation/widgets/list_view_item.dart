import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:intelligent_tutoring_system/fetures/presentingLos/data/api_services/los_api_services.dart';
import 'package:intelligent_tutoring_system/fetures/presentingLos/data/repo/los_repo.dart';
import 'package:intelligent_tutoring_system/fetures/presentingLos/presentation/cubit/los_cubit.dart';
import 'package:intelligent_tutoring_system/fetures/presentingLos/presentation/view/los_view.dart';
import '../../../../core/helper/completion_los_helper.dart';
import '../../data/models/user_path_response_model.dart';

class LearningObjectItem extends StatefulWidget {
  final LearningObject learningObject;
  final int index;

  const LearningObjectItem({
    super.key,
    required this.learningObject,
    required this.index,
  });

  @override
  State<LearningObjectItem> createState() => _LearningObjectItemState();

}

class _LearningObjectItemState extends State<LearningObjectItem> {

  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    _checkIfCompleted();
  }

  Future<void> _checkIfCompleted() async {
    final completed = await CompletionLosHelper.isLoCompleted(
        widget.learningObject.loId);
    setState(() {
      isCompleted = completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progressValue = isCompleted ? 1 : 0;
    double radius = 35;
    double angle = 2 * pi * progressValue;
    double iconSize = 25;
    double iconX = cos(angle - pi / 2) * radius;
    double iconY = sin(angle - pi / 2) * radius;

    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: sin(widget.index * pi / 4) * 50 + 160,
            child: GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BlocProvider(
                          create: (_) =>
                              LOsCubit(LORepository(LOApiService(Dio()))),
                          child: LOsView(
                            loId: widget.learningObject.loId,
                            name: widget.learningObject.name,
                          ),
                        ),
                  ),
                );
                // أعد البناء بعد الرجوع، إذا تم تحديث الحالة
                if (result == true) {
                  (context as Element).markNeedsBuild(); // Force rebuild
                }
                _checkIfCompleted();
              },
              child: SizedBox(
                width: 80,
                height: 80,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: CircularProgressIndicator(
                        value: progressValue,
                        strokeWidth: 6,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.green.shade400),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -6),
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white60,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(0, 6),
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            isCompleted ? Icons.check_circle : Icons
                                .star_rounded,
                            size: 38,
                            color: isCompleted
                                ? Colors.green
                                : Colors.grey.withOpacity(.8),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 40 + iconX - iconSize / 2,
                      top: 32 + iconY - iconSize / 2,
                      child: Container(
                        width: iconSize,
                        height: iconSize,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.star,
                          size: iconSize,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
