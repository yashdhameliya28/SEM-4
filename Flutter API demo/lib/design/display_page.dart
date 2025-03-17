import 'package:api_demo/api/api_service.dart';
import 'package:api_demo/design/add_edit_page.dart';
import 'package:flutter/material.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({super.key});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student List')),
      body: FutureBuilder(
        future: api.getStudent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No Student Found'));
          }

          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Text(snapshot.data[index]['name']),
                    Text(snapshot.data[index]['email']),
                    IconButton(
                      onPressed: () async {
                        await api.deleteStudent(id: snapshot.data[index]['id']);
                        setState(() {});
                      },
                      icon: Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => AddEditPage(
                                  studentDetail: snapshot.data[index],
                                ),
                          ),
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
                  ],
                ),
              );
            },
            itemCount: snapshot.data!.length,
          );
        },
      ),
    );
  }
}
