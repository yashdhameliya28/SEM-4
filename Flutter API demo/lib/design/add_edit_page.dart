import 'package:api_demo/api/api_service.dart';
import 'package:api_demo/design/display_page.dart';
import 'package:flutter/material.dart';

class AddEditPage extends StatefulWidget {
  Map<String, dynamic>? studentDetail;

  AddEditPage({super.key, this.studentDetail});

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  TextEditingController nameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();
  ApiService api = ApiService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.studentDetail != null) {
      nameCon.text = widget.studentDetail!['name'];
      emailCon.text = widget.studentDetail!['email'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.studentDetail == null ? 'Add' : 'Edit'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return 'Enter name';
                }
              },
              controller: nameCon,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                label: Text("Name"),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return 'Enter email';
                }
              },
              controller: emailCon,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                label: Text("Email"),
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  Map<String, dynamic> map = {};
                  map['name'] = nameCon.text.toString();
                  map['email'] = emailCon.text.toString();

                  if (widget.studentDetail == null) {
                    await api.insertstudent(map: map);
                    setState(() {});
                  } else {
                    await api.updateStudent(
                      id: widget.studentDetail!['id'],
                      map: map,
                    );
                    setState(() {});
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DisplayPage()),
                  );
                  setState(() {});
                }
              },
              child: Text(widget.studentDetail == null ? 'SAVE' : 'EDIT'),
            ),
          ],
        ),
      ),
    );
  }
}
