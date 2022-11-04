import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbConfig {
  var db;
  var databasesPath;
  String? path;
  Database? database;
  int? count;

  configDb() async {
    // await createDatabase();
    await getLocationofDb();
    await setupTheDb();
    await insertRecord();
    await updateRecord();
    await getRecords();
    await getTotalRecords();
    await closeDatabaseAvail();
  }

//db creation
  createDatabase() async {
    db = await openDatabase('my_db.db');
  }

//close database
  closeDatabase() async {
    if (db != null) {
      await db.close();
    }
  }

  // Get a location using getDatabasesPath
  getLocationofDb() async {
    databasesPath = await getDatabasesPath();
    path = join(databasesPath, 'demo.db');
    print(databasesPath);
    print(path);
  }

// Delete the database
  deleteDb() async {
    await deleteDatabase(path!);
  }

// open the database
  setupTheDb() async {
    database = await openDatabase(path!, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });
  }

// Insert some records in a transaction
  insertRecord() async {
    await database!.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
      print('inserted1: $id1');
      int id2 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
          ['another name', 12345678, 3.1416]);
      print('inserted2: $id2');
    });
  }

// Update some record
  updateRecord() async {
    int count = await database!.rawUpdate(
        'UPDATE Test SET name = ?, value = ? WHERE name = ?',
        ['updated name', '9876', 'some name']);
    print('updated: $count');
  }

// Get the records
  getRecords() async {
    List<Map> list = await database!.rawQuery('SELECT * FROM Test');
    List<Map> expectedList = [
      {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
      {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
    ];
    print(list);
    print(expectedList);
//assert(const DeepCollectionEquality().equals(list, expectedList));
  }

// Count the records
  getTotalRecords() async {
    count = Sqflite.firstIntValue(
                await database!.rawQuery('SELECT COUNT(*) FROM Test')) !=
            null
        ? Sqflite.firstIntValue(
            await database!.rawQuery('SELECT COUNT(*) FROM Test'))!
        : 0;
  }
//assert(count == 2);}

// Delete a record
  deleteRecord() async {
    count = await database!
        .rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
    assert(count == 1);
  }

// Close the database
  closeDatabaseAvail() async {
    await database!.close();
  }
}
