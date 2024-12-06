import 'package:flutter/material.dart';
import 'package:listviewpractice/common/student_listview.dart';
import 'package:listviewpractice/model/student.dart';

class StudentDetailsView extends StatefulWidget {
  const StudentDetailsView({super.key});

  @override
  State<StudentDetailsView> createState() => _StudentDetailsViewState();
}

class _StudentDetailsViewState extends State<StudentDetailsView> {
  // for gapping vertically
  final _gap = const SizedBox(
    height: 8,
  );

  // drop down elements
  final items = [
    const DropdownMenuItem(value: 'Kathmandu', child: Text('Kathmandu')),
    const DropdownMenuItem(value: 'Pokhara', child: Text('Pokhara')),
    const DropdownMenuItem(value: 'Chitwan', child: Text('Chitwan')),
  ];

  List<Student> listStudents = [];

  String? selectedCity;

  // controllers
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // context eta balla ready huncha (thal ready for upcoming bhat) and we can display scaffold and stuff on the display
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  // app falne (background apps > swipe out)
  @override
  void dispose() {
    // to prevent memory leaks
    _fnameController.dispose();
    _lnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: _fnameController,
              decoration: const InputDecoration(
                labelText: 'Enter first name: ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            _gap,
            TextFormField(
              controller: _lnameController,
              decoration: const InputDecoration(
                labelText: 'Enter last name: ',
                border: OutlineInputBorder(),
              ),
            ),
            _gap,
            DropdownButtonFormField(
              // icon: Icon(Icons.arrow_downward),
              items: items,
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
              },
              decoration: const InputDecoration(labelText: "Select City"),
            ),
            _gap,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Student student = Student(
                      fname: _fnameController.text.trim(),
                      lname: _lnameController.text.trim(),
                      city: selectedCity!,
                    );
                    listStudents.add(student);
                    setState(() {
                      listStudents.add(student);
                    });

                    debugPrint(listStudents.length.toString());
                  },
                  child: const Text("Add student")),
            ),
            _gap,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/output',
                      arguments: listStudents,
                    );
                  },
                  child: const Text("View students")),
            ),
            // Display student details in listView
            listStudents.isEmpty
                ? const Text("No data")
                : StudentListView(listStudents: listStudents),
          ],
        ),
      ),
    );
  }
}
