import 'package:database_demo/database/database.dart';
import 'package:flutter/material.dart';

import 'display_page.dart';

class AddEditPage extends StatefulWidget {
  Map<String, dynamic>? studentData;

  AddEditPage({super.key, this.studentData});

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  TextEditingController nameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController ageCon = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();
  DatabaseDemo db = DatabaseDemo();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.studentData != null) {
      nameCon.text = widget.studentData!['name'];
      emailCon.text = widget.studentData!['email'];
      ageCon.text = widget.studentData!['age'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.studentData != null ? 'Edit Student' : 'Add Student',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Container(
              width: 600,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    TextFormField(
                      controller: nameCon,
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return "Enter name";
                        }
                      },
                      decoration: InputDecoration(
                        label: Text('Name'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: emailCon,
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return "Enter email";
                        }
                      },
                      decoration: InputDecoration(
                        label: Text('Email'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: ageCon,
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return "Enter age";
                        }
                      },
                      decoration: InputDecoration(
                        label: Text('Age'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          Map<String, dynamic> studentData = {};
                          studentData['name'] = nameCon.text.toString();
                          studentData['email'] = emailCon.text.toString();
                          studentData['age'] = ageCon.text.toString();

                          if (widget.studentData == null) {
                            await db.insertStudent(studentData);
                          } else {
                            await db.updateStudent(
                              widget.studentData!['id'],
                              studentData,
                            );
                            Navigator.pop(context);
                            setState(() {});
                          }
                          setState(() {
                            nameCon.clear();
                            emailCon.clear();
                            ageCon.clear();
                          });
                        }
                      },
                      child: Text(widget.studentData != null ? 'EDIT' : 'SAVE'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DisplayPage(),
                          ),
                        );
                      },
                      child: Text("STUDENT LIST"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
