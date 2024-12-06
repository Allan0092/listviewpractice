import 'package:flutter/material.dart';
import 'package:listviewpractice/model/student.dart';

class StudentListView extends StatelessWidget {
  const StudentListView({
    super.key,
    required this.listStudents,
  });

  final List<Student> listStudents;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        // builder because dynamic
        itemCount: listStudents.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.account_circle),
            title: Text(
                '${listStudents[index].fname} ${listStudents[index].lname}'),
            subtitle: Text(listStudents[index].city),
            trailing:
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          );
        },
      ),
    );
  }
}
