import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_tutoring_system/core/general_widgets/custom_appBar.dart';
import 'package:intelligent_tutoring_system/core/helper/cashed_learning_objects.dart';
import 'package:intelligent_tutoring_system/fetures/presentingLos/presentation/view/widgets/speech_bubble_painter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../core/general_widgets/app_text_buttom.dart';
import '../../../../core/helper/completion_los_helper.dart';
import '../cubit/los_cubit.dart';
import '../cubit/los_states.dart';

class LOsView extends StatefulWidget {
  final int loId;
  final String name;

  const LOsView({
    super.key,
    required this.loId,
    required this.name,
  });

  @override
  State<LOsView> createState() => _LOsViewState();
}

class _LOsViewState extends State<LOsView> {
  int currentIndex = 0;
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    context.read<LOsCubit>().fetchSubLOs(widget.loId);
  }

  void _loadUrl(String url) {
    if (url.isNotEmpty) {
      controller.loadRequest(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<LOsCubit, LOsState>(
        builder: (context, state) {
          if (state is LOsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LOsError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          }

          if (state is LOsSuccess) {
            return Column(
              children: [
                CustomAppBar(
                  title: 'Lesson ${currentIndex + 1}',
                  showBackButton: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/Add a heading(16) 1.png',
                      height: 120,
                    ),
                    CustomPaint(
                      painter: SpeechBubblePainter(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        margin: const EdgeInsets.only(left: 2),
                        child: const Text(
                          'Don’t forget to \n take notes!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: WebViewWidget(
                    controller: controller
                      ..loadRequest(Uri.parse(
                          state.response.subLos[currentIndex].material)),
                  ),
                ),
                if (currentIndex < state.response.subLos.length - 1)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomButton(
                      size: ButtonSize.large,
                      label:
                          'Next: ${state.response.subLos[currentIndex + 1].name}',
                      variant: ButtonVariant.super_,
                      onPressed: () {
                        print('ID: ${widget.loId}');
                        if (currentIndex < state.response.subLos.length - 1) {
                          setState(() {
                            currentIndex++;
                            _loadUrl(
                                state.response.subLos[currentIndex].material);
                          });
                        }
                      },
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomButton(
                      size: ButtonSize.large,
                      label: 'Back to Topics',
                      variant: ButtonVariant.super_,
                      onPressed: () async {
                        await SavedAllTopics().addString(widget.name);
                        final saved = await SavedAllTopics().getStringList();
                        print("📦 المواضيع المحفوظة حالياً: $saved");
                        await CompletionLosHelper.markLoAsCompleted(
                            widget.loId); // ✅
                        Navigator.pop(context);
                      },
                    ),
                  ),
              ],
            );
          }
          return const Center(
            child: Text('Something went wrong'),
          );
        },
      ),
    );
  }
}
