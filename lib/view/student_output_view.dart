import 'package:flutter/material.dart';
import 'package:listviewpractice/common/student_listview.dart';
import 'package:listviewpractice/model/student.dart';

class StudentOutputView extends StatefulWidget {
  const StudentOutputView({super.key});

  @override
  State<StudentOutputView> createState() => _StudentOutputViewState();
}

class _StudentOutputViewState extends State<StudentOutputView> {
  List<Student> listStudents = [];

  @override
  void didChangeDependencies() {
    listStudents = ModalRoute.of(context)!.settings.arguments as List<Student>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listStudents.isEmpty
          ? const Center(child: Text('Data chainaa'))
          : StudentListView(listStudents: listStudents),
    );
  }
}
