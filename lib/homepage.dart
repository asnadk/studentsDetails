
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Student {
  final String name;
  final String rollNumber;
  final String classs;

  Student({required this.name, required this.rollNumber,required this.classs});
}
class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController rollNumberController = TextEditingController();
  TextEditingController classsController=TextEditingController();
  List<Student> students = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
        backgroundColor: Color.fromARGB(221, 7, 166, 202),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Enter  ur Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: rollNumberController,
              decoration: InputDecoration(labelText: 'Enter ur  Roll Number'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: classsController,
              decoration: InputDecoration(labelText: 'enter ur class'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addStudent();
              
            },
            child: Text('Add Student'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('Name: ${students[index].name}'),
                    subtitle: Text('Roll Number: ${students[index].rollNumber}'),
                    trailing: Text("class:${students[index].classs}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }




  void addStudent() {
    setState(() {
      String name = nameController.text;
      String rollNumber = rollNumberController.text;
      String classs=classsController.text;

      if (name.isNotEmpty && rollNumber.isNotEmpty) {
        students.add(Student(name: name, rollNumber: rollNumber,classs: classs));
        nameController.clear();
        rollNumberController.clear();
        classsController.clear();

      }
    });
  }
}
