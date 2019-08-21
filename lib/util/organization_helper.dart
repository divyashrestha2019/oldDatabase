import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:database/database/organization.dart';
class OrganizationHelper {

  static OrganizationHelper _organizationHelper; // Singleton OrganizationHelper
  Database _database;

  String orgTable = 'org_table';
  String colId = 'id';
  String colName = 'name';
  String colEmail = 'email';
  String colPhone = 'phone';
  String colCity = 'city';
  String colCountry = 'country';

  OrganizationHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory OrganizationHelper() {

    if (_organizationHelper == null) {
      _organizationHelper = OrganizationHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _organizationHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'ogranizations.db';
    //open or create database
    var organizationsDatabase =
    await openDatabase(path, version: 1, onCreate: _createDB);
    return organizationsDatabase;
  }

  void _createDB(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $orgTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colName TEXT, $colEmail TEXT,'
            ' $colPhone TEXT, $colCity TEXT, $colCountry TEXT)');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getOrganizationMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $orgTable order by $colId ASC');
    var result = await db.query(orgTable, orderBy: '$colName ASC');
    return result;
  }

//insert into database
  Future<int> insertOrganization(Organization organization) async {
    Database db = await this.database;
    int result = await db.insert(orgTable, organization.toMap());
    return result;
  }

// Update Operation: Update a Note object and save it to database
  Future<int> updateOrganization(Organization organization) async {
    var db = await this.database;
    int result = await db.update(orgTable, organization.toMap(),
        where: '$colId = ?', whereArgs: [organization.id]);
    return result;
  }

  //delete data base
  Future<int> deleteOrganization(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $orgTable WHERE $colId = $id');
    return result;
  }

  //count organization
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
    await db.rawQuery('SELECT COUNT (*) from $orgTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }


  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Organization>> getOrgList() async {

    var orgMapList = await getOrganizationMapList(); // Get 'Map List' from database
    int count = orgMapList.length;         // Count the number of map entries in db table

    List<Organization> orgList = List<Organization>();
    // For loop to create a 'organization List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      orgList.add(Organization.fromMapObject(orgMapList[i]));
    }

    return orgList;
  }
}
