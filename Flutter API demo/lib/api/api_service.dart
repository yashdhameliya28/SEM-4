import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  String baseURL = 'https://67ca9d47102d684575c60548.mockapi.io/student_data';

  Future<dynamic> getStudent() async {
    http.Response res = await http.get(Uri.parse(baseURL));
    return jsonDecode(res.body);
  }

  Future<dynamic> insertstudent({map}) async {
    http.Response res = await http.post(Uri.parse(baseURL), body: map);
    return jsonDecode(res.body);
  }

  Future<dynamic> updateStudent({id, map}) async {
    http.Response res = await http.put(Uri.parse(baseURL + '/$id'), body: map);
    return jsonDecode(res.body);
  }

  Future<dynamic> deleteStudent({id}) async {
    http.Response res = await http.delete(Uri.parse(baseURL + '/$id'));
    return jsonDecode(res.body);
  }
}
