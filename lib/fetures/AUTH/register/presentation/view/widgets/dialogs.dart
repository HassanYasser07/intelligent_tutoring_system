import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/routing/routing.dart';
import '../../../../../../core/theme/style.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent dismissing by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Signup Successful'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Congratulations, you have signed up successfully!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              disabledForegroundColor: Colors.grey.withOpacity(0.38),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              GoRouter.of(context)
                  .push(Routes.kCourseView); // Navigate to login
            },
            child: const Text('Continue'),
          ),
        ],
      );
    },
  );
 }
void setupErrorState(BuildContext context, String error) {
  String userFriendlyMessage;

  if (error.contains('401') || error.toLowerCase().contains('unauthorized')) {
    userFriendlyMessage = 'Invalid email or password. Please try again.';
  } else if (error.toLowerCase().contains('timeout')) {
    userFriendlyMessage = 'The connection timed out. Please try again later.';
  } else if (error.toLowerCase().contains('socket') || error.toLowerCase().contains('network')) {
    userFriendlyMessage = 'No internet connection. Please check your network and try again.';
  } else {
    userFriendlyMessage = 'An unexpected error occurred. Please try again.';
  }

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        userFriendlyMessage,
        style: Styles.font15DarkBlueMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'OK',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ),
      ],
    ),
  );
}
//
//
// void setupErrorState(BuildContext context, String error) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       icon: const Icon(
//         Icons.error,
//         color: Colors.red,
//         size: 32,
//       ),
//       content: Text(
//         error,
//         style: Styles.font15DarkBlueMedium,
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           }, // Just close the dialog
//           child: const Text(
//             'Got it',
//             style: TextStyle(
//               color: Colors.green,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
