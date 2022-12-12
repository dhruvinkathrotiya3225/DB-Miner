import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../modal/Global.dart';
import 'image_api_helper.dart';

class DBHelpers {
  DBHelpers._();
  static final DBHelpers dbHelpers = DBHelpers._();

  final String dbName = "animalData.db";
  final String colId = "id";
  final String colTime = "time";
  // final String colPrice = "price";
  final String colImage = "image";
  final String colName = "name";
  final String colDescription = "description";

  Database? db;

  Future<void> initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbName);

    String query2 =
        "CREATE TABLE IF NOT EXISTS ${Globle.animalDataTableName}Data($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, $colDescription TEXT, $colImage BLOB);";
    await db?.execute(query2);
  }

  insertAnimalRecord() async {
    await initDB();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 5; i++) {
      Uint8List? image = await ImageAPIHelper.imageAPIHelper
          .getImage(name: Globle.animalDataTableName);

      String query =
          "INSERT INTO ${Globle.animalDataTableName}Data($colName, $colDescription, $colImage) VALUES(?, ?, ?);";
      List args = [
        Globle.animalDataTableName,
        Globle.animalDesc,
        image,
      ];

      await db?.rawInsert(query, args);
    }
    prefs.setBool('${Globle.animalDataTableName}isEmpty', false);
  }

  updateAnimalDataRecord() async {
    await initDB();

    for (int i = 0; i < 5; i++) {
      Uint8List? image = await ImageAPIHelper.imageAPIHelper
          .getImage(name: Globle.animalDataTableName);

      String query =
          "UPDATE ${Globle.animalDataTableName}Data SET $colName=?, $colDescription=?, $colImage=? WHERE $colId = ?;";
      List args = [
        Globle.animalDataTableName,
        Globle.animalDesc,
        image,
        i + 1,
      ];

      await db?.rawUpdate(query, args);
    }
  }

  Future<List<AnimalDB>?> fetchAllAnimalRecords() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isEmpty =
        prefs.getBool('${Globle.animalDataTableName}isEmpty') ?? true;

    (isEmpty) ? await insertAnimalRecord() : await updateAnimalDataRecord();

    String query = "SELECT * FROM ${Globle.animalDataTableName}Data;";
    List<Map<String, dynamic>>? data = await db?.rawQuery(query);

    List<AnimalDB>? animalData =
        data?.map((e) => AnimalDB.fromData(e)).toList();
    print("=====================================================");
    print("${animalData}");
    print("=====================================================");
    return animalData;
  }
}
