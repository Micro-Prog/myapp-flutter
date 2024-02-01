import 'package:App/db/models/levelsmodel/levelsmodel.dart';
import 'package:App/db/models/testtypesmodel/testtypesmodel.dart';
import 'package:App/default/default/eng/test_structures/test_structures.dart';
import 'package:App/default/default/general/levels/levels.dart';
import 'package:App/default/default/general/testtypesall/testtypesall.dart';
import 'dart:developer';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import 'package:sqflite_sqlcipher/sql.dart';
import 'package:sqflite_sqlcipher/sqlite_api.dart';
import 'package:uuid/uuid.dart';

import '../models/teststructure/test_structure.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final getDirectory = await getApplicationDocumentsDirectory();
    String path = getDirectory.path + '/testingo_all_tests.db';
    log(path);
    return await openDatabase(
      path,
      onCreate: _onCreate,
      password: "secret",
      version: 1,
    );
  }

  void _onCreate(
    Database db,
    int version,
  ) async {

    await db.execute(
        'CREATE TABLE IF NOT EXISTS levels(langName TEXT, name TEXT, info TEXT, UNIQUE(name))');

    await db.execute(
        'CREATE TABLE IF NOT EXISTS teststructure(testStructureId TEXT, testStructureName TEXT, testStructureInfo TEXT, testStructureCode TEXT, testStructureLang TEXT, testStructureType TEXT, testStructureDifficulty TEXT, UNIQUE(testStructureId))');

    await db.execute(
        'CREATE TABLE IF NOT EXISTS testtypesall(typeCode TEXT, typeName TEXT, typeInfo TEXT, langName TEXT, langInfo TEXT, langCode TEXT, UNIQUE(typeCode))');

    log('TABLE CREATED');
  }

  /// *** test structure *** ///
  Future<void> insertTestStructuresAll() async {
    final db = await _databaseService.database;

    final defaultTestStructures = testStructuresDefault;

    int i;
    for (i = 0; i < defaultTestStructures.length; i++) {
      await db.rawQuery(
          'INSERT OR IGNORE INTO teststructure(testStructureId, testStructureName, testStructureInfo, testStructureCode, testStructureLang, testStructureType, testStructureDifficulty) VALUES (?,?,?,?,?,?,?)',
          [
            defaultTestStructures[i].testStructureId,
            defaultTestStructures[i].testStructureName,
            defaultTestStructures[i].testStructureInfo,
            defaultTestStructures[i].testStructureCode,
            defaultTestStructures[i].testStructureLang,
            defaultTestStructures[i].testStructureType,
            defaultTestStructures[i].testStructureDifficulty,
          ]);
    }
  }

  Future<List<TestStructure>> getTestStructureForOne(
    String testStructureLang,
    String testStructureType,
  ) async {
    final db = await _databaseService.database;

    var data = await db.rawQuery(
        'SELECT * FROM teststructure WHERE testStructureLang="$testStructureLang" AND testStructureType="$testStructureType"');

    List<TestStructure> testStructures = List.generate(
        data.length, (index) => TestStructure.fromJson(data[index]));

    return testStructures;
  }

  /// *** test types *** ///
  Future<void> inserTestTypesAll() async {
    final db = await _databaseService.database;

    final defaultTestTypesAll = testTypesAll;

    int i;
    for (i = 0; i < defaultTestTypesAll.length; i++) {
      await db.rawQuery(
          'INSERT OR IGNORE INTO testtypesall(typeCode, typeName, typeInfo, langName, langInfo, langCode) VALUES (?,?,?,?,?,?)',
          [
            defaultTestTypesAll[i].typeCode,
            defaultTestTypesAll[i].typeName,
            defaultTestTypesAll[i].typeInfo,
            defaultTestTypesAll[i].langName,
            defaultTestTypesAll[i].langInfo,
            defaultTestTypesAll[i].langCode,
          ]);
    }
  }

  Future<List<TestTypesModel>> getTestTypesAll(String langName) async {
    final db = await _databaseService.database;

    var data = await db
        .rawQuery('SELECT * FROM testtypesall WHERE langName = "$langName"');

    List<TestTypesModel> testtypes = List.generate(
        data.length, (index) => TestTypesModel.fromJson(data[index]));

    return testtypes;
  }



  // *** Eng Levels *** ///
  Future<void> insertDefaultLevels() async {
    final db = await _databaseService.database;

    final defaultLevelsToInsert = defaultLevels;

    int i;
    for (i = 0; i < defaultLevelsToInsert.length; i++) {
      await db.rawQuery(
          'INSERT OR IGNORE INTO levels(langName, name, info) VALUES (?,?,?)', [
        defaultLevelsToInsert[i].langName,
        defaultLevelsToInsert[i].name,
        defaultLevelsToInsert[i].info,
      ]);
    }
  }

  Future<List<LevelsModel>> getDefaultLevels() async {
    final db = await _databaseService.database;

    var data = await db.rawQuery('SELECT * FROM levels');

    List<LevelsModel> levels = List.generate(
        data.length, (index) => LevelsModel.fromJson(data[index]));

    return levels;
  }
}
