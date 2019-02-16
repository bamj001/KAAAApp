import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:kaaa_app/models/alumni.dart';

class AlumniDatabaseHelper {

  static AlumniDatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
  static Database _database;                // Singleton Database

  String alumniTable = 'alumni_table';
  String colId = 'id';
  String colName = 'name';
  String colKingsGraduatingClass = 'kingsGraduatingClass';
  String colEmail = 'email';
  String colSecondaryEmail = 'secondaryEmail';
  String colCurrentCity = 'currentCity';
  String colCurrentCountry ='currentCountry';
  String colMajor = 'major';
  String colCollege = 'college';

  AlumniDatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory AlumniDatabaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = AlumniDatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'alumni.db';

    // Open/create the database at a given path
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $alumniTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, '
        '$colEmail TEXT, $colKingsGraduatingClass TEXT, $colSecondaryEmail TEXT, $colCurrentCity TEXT, '
        '$colCurrentCountry TEXT, $colMajor TEXT, $colCollege TEXT)');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getAlumniMapList() async {
    Database db = await this.database;

    var result = await db.query(alumniTable, orderBy: '$colKingsGraduatingClass ASC');
    return result;
  }

  // Insert Operation: Insert an Alumni object to database
  Future<int> insertAlumni(Alumni alumni) async {
    Database db = await this.database;
    var result = await db.insert(alumniTable, alumni.toMap());
    return result;
  }

  // Update Operation: Update an Alumni object and save it to database
  Future<int> updateAlumni(Alumni alumni) async {
    var db = await this.database;
    var result = await db.update(alumniTable, alumni.toMap(), where: '$colId = ?', whereArgs: [alumni.id]);
    return result;
  }

  // Delete Operation: Delete an Alumni object from database
  Future<int> deleteAlumni(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $alumniTable WHERE $colId = $id');
    return result;
  }

  // Get number of Alumni objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $alumniTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Alumni List' [ List<Alumni> ]
  Future<List<Alumni>> getAlumniList() async {

    var alumniMapList = await getAlumniMapList(); // Get 'Map List' from database
    int count = alumniMapList.length;         // Count the number of map entries in db table

    List<Alumni> alumniList = List<Alumni>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      alumniList.add(Alumni.fromMapObject(alumniMapList[i]));
    }

    return alumniList;
  }

}






