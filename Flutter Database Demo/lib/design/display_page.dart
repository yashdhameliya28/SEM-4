import 'package:database_demo/database/database.dart';
import 'package:database_demo/design/add_edit_page.dart';
import 'package:flutter/material.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({super.key});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  DatabaseDemo db = DatabaseDemo();
  List<Map<String, dynamic>> studentList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("List Of Students"))),
      body: FutureBuilder(
        future: db.getStudentList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Text(
                "No Student Found",
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
          studentList = snapshot.data!;

          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        studentList[index]['name'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        studentList[index]['email'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        studentList[index]['age'],
                        style: TextStyle(fontSize: 20),
                      ),
                      // SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () async {
                              await db.deleteStudent(studentList[index]['id']);
                              setState(() {});
                            },
                            icon: Icon(Icons.delete, color: Colors.red,),
                          ),
                          SizedBox(height: 10),
                          IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => AddEditPage(
                                        studentData: studentList[index],
                                      ),
                                ),
                              );
                            },
                            icon: Icon(Icons.edit, color: Colors.blue,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: studentList.length,
          );
        },
      ),
    );
  }
}
