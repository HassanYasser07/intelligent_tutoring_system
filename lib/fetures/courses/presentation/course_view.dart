import 'package:flutter/material.dart';
import 'package:intelligent_tutoring_system/fetures/courses/presentation/widgets/course_view_body.dart';
class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CourseViewBody(),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class CourseView extends StatefulWidget {


//   const CourseView({super.key, });

//   @override
//   State<CourseView> createState() => _CourseViewState();
// }

// class _CourseViewState extends State<CourseView> {
//   late final WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..loadRequest(Uri.parse('https://www.youtube.com/watch?v=9hVVQhEmJI4'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Course'),
//       ),
//       body: WebViewWidget(controller: _controller),
//     );
//   }
// }
