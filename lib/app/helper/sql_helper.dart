import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper {
  static String path = '';

  static Future<void> createTables(Database database) async {
    await database.execute(
        'CREATE TABLE IF NOT EXISTS tbl_profile( id INTEGER PRIMARY KEY NOT NULL,full_name TEXT,phone TEXT,email TEXT,address Text,image Text)');
    print("createTables call");
    await createItem(database);
  }

  static databaseCreate() async {
    var databasesPath = await getDatabasesPath();
    path = await join(databasesPath, 'studentdb.db');
    print("Db1 call$path");

    final database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      print("db call");
    });
    return database;
  }

  static deletedb() async {
    print("Delete");
    await deleteDatabase(path);
  }

  static createItem(Database database) async {
    print("createItem call");

    await database.transaction(
      (txn) async {
        int id = await txn.rawInsert(
            'INSERT INTO tbl_profile(id, full_name, phone, email, address, image) VALUES("1", "", "", "shanto@gmail.com", "", "")');
        print('inserted1: $id');
      },
    );
    //  getItems1();
  }

  static updateItem(
    Database database,
    String full_name,
    String phone,
    String email,
    String address,
    String image,
  ) async {
    final count = await database.rawUpdate(
        'UPDATE tbl_profile SET full_name = ?, phone= ?, email = ?, address= ?, image = ? WHERE id = "1"',
        [full_name, phone, email, address, image]);
    print('updated: $count');
  }

  static Future<void> deleteItem(int id) async {
    final db = await SqlHelper.databaseCreate();
    try {
      await db.delete("tbl_students", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  static Future<List<Map<String, dynamic>>> getProfileInfo(Database db) async {
    print("Before Get DAta");
    // return db.query('tbl_students', orderBy: "id");
    print("Get DAta");
    print(db.rawQuery('SELECT * FROM tbl_profile').toString());
    return await db.rawQuery('SELECT * FROM tbl_profile');
  }
}
