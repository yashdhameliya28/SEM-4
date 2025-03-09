import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseDemo {
  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'DatabaseDemo.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute('''CREATE TABLE stdeunts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        age TEXT
      )''');
      },
      version: 1,
    );
  }

  Future<int> insertStudent(Map<String, dynamic> studentData) async {
    Database db = await initDatabase();
    return db.insert('stdeunts', studentData);
  }

  Future<int> updateStudent(
    int id,
    Map<String, dynamic> updatedStudentData,
  ) async {
    Database db = await initDatabase();
    return db.update(
      'stdeunts',
      updatedStudentData,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteStudent(int id) async {
    Database db = await initDatabase();
    return db.delete('stdeunts', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getStudentList() async {
    Database db = await initDatabase();
    return db.query('stdeunts');
  }
}
