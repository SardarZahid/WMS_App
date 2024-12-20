import 'package:flutter/material.dart';
import 'package:myapp/LoginOther/feedback.dart';

// Feedback model class
class FeedbackModel {
  final String title;
  final String comment;

  FeedbackModel({required this.title, required this.comment});
}

// Global feedback list
List<FeedbackModel> feedbackList = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feedback App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const FeedbackScreen(),
    );
  }
}