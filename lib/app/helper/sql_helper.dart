import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper {
  static String path = '';

  static Future<void> createTables(Database database) async {
    await database.execute(
        'CREATE TABLE  tbl_profile( id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,full_name TEXT,email TEXT,image Text)');
    print("createTables call");
    //createItem();
  }

  static Future db() async {
    print(" call");
    // Database database = openDatabase(
    //   path,
    //   version: 1,
    //   onCreate: (Database database, int version) async {
    //     print("db call");
    //     await createTables(database);
    //   },
    // );
    final database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      print("db call");
      await createTables(db);
    });
    return database;
  }

  static db1() async {
    var databasesPath = await getDatabasesPath();
    path = join(databasesPath, 'studentdb.db');
    print("Db1 call$path");
  }

  static deletedb() async {
    print("Delete");
    await deleteDatabase(path);
  }

  static createItem() async {
    print("createItem call");

    final db = await SqlHelper.db();

    await db.transaction(
      (txn) async {
        int id = await txn.rawInsert(
            'INSERT INTO tbl_profile(full_name, email, image) VALUES("some name", "shanto@gmail.com", "shanto.jpg")');
        print('inserted1: $id');
      },
    );
    //  getItems1();
  }

  static updateItem(
    String full_name,
    String? email,
    String image,
  ) async {
    final db = await SqlHelper.db();

    final count = await db.rawUpdate(
        'UPDATE tbl_profile SET full_name = "Hi", email = ?,image = ? WHERE full_name = "some name"',
        ['akbar217@gmail.com', 'akbar.jpg']);
    print('updated: $count');
  }

  static Future<void> deleteItem(int id) async {
    final db = await SqlHelper.db();
    try {
      await db.delete("tbl_students", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SqlHelper.db();
    return db.query('tbl_students', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItems1() async {
    print("Before Get DAta");
    final db = await SqlHelper.db();
    // return db.query('tbl_students', orderBy: "id");
    print("Get DAta");
    print(db.rawQuery('SELECT * FROM tbl_profile').toString());
    return await db.rawQuery('SELECT * FROM tbl_profile');
  }
}
