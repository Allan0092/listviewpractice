import 'package:flutter/material.dart';
import 'package:listviewpractice/view/student_details_view.dart';
import 'package:listviewpractice/view/student_output_view.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const StudentDetailsView(),
        '/output': (context) => const StudentOutputView(),
      },
    ),
  );
}
