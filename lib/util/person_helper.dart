import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:database/database/person.dart';

class PersonHelper {

  static PersonHelper _personHelper; // Singleton PersonHelper
  Database _database;

  String perTable = 'person_table';
  String colId = 'id';
  String colName = 'name';
  String colOrg = 'organization';
  String colEmail = 'email';
  String colPhone = 'phone';
  String colCity = 'city';
  String colCountry = 'country';

  PersonHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory PersonHelper() {

    if (_personHelper == null) {
      _personHelper = PersonHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _personHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'persons.db';
    //open or create database
    var personsDatabase =
    await openDatabase(path, version: 1, onCreate: _createDB);
    return personsDatabase;
  }

  void _createDB(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $perTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colName TEXT,$colOrg TEXT, $colEmail TEXT,'
            ' $colPhone TEXT, $colCity TEXT, $colCountry TEXT)');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getPersonMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $orgTable order by $colId ASC');
    var result = await db.query(perTable, orderBy: '$colName ASC');
    return result;
  }

//insert into database
  Future<int> insertPerson(Person person) async {
    Database db = await this.database;
    int result = await db.insert(perTable, person.toMap());
    return result;
  }

// Update Operation: Update a Note object and save it to database
  Future<int> updatePerson(Person person) async {
    var db = await this.database;
    int result = await db.update(perTable, person.toMap(),
        where: '$colId = ?', whereArgs: [person.id]);
    return result;
  }

  //delete data base
  Future<int> deletePerson(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $perTable WHERE $colId = $id');
    return result;
  }

  //count person
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
    await db.rawQuery('SELECT COUNT (*) from $perTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }


  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Person>> getOrgList() async {

    var orgMapList = await getPersonMapList(); // Get 'Map List' from database
    int count = orgMapList.length;         // Count the number of map entries in db table

    List<Person> orgList = List<Person>();
    // For loop to create a 'person List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      orgList.add(Person.fromMapObject(orgMapList[i]));
    }

    return orgList;
  }
}
