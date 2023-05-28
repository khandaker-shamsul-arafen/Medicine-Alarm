import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper {
  static String path = '';

  static Future<void> createTables(Database database) async {
    await database.execute(
        'CREATE TABLE IF NOT EXISTS tbl_profile( id INTEGER PRIMARY KEY NOT NULL,full_name TEXT,phone TEXT,email TEXT,address Text,image Text)');
    await createItem(database);
  }

  static databaseCreate() async {
    var databasesPath = await getDatabasesPath();
    path = await join(databasesPath, 'medicine_reminder.db');
    final database = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    return database;
  }

  // static deletedb() async {
  //   await deleteDatabase(path);
  // }

  static createItem(Database database) async {
    await database.transaction(
      (txn) async {
        await txn.rawInsert(
            'INSERT INTO tbl_profile(id, full_name, phone, email, address, image) VALUES("1", "", "", "shanto@gmail.com", "", "")');
      },
    );
  }

  static updateItem(
    Database database,
    String full_name,
    String phone,
    String email,
    String address,
    String image,
  ) async {
    await database.rawUpdate(
        'UPDATE tbl_profile SET full_name = ?, phone= ?, email = ?, address= ?, image = ? WHERE id = "1"',
        [full_name, phone, email, address, image]);
  }

  static Future<List<Map<String, dynamic>>> getProfileInfo(Database db) async {
    return await db.rawQuery('SELECT * FROM tbl_profile');
  }
}
