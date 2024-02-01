import 'package:App/db/models/levelsmodel/levelsmodel.dart';
import 'package:App/db/models/testtypesmodel/testtypesmodel.dart';
import 'package:App/db/service/sqlite_service.dart';
import 'package:http/http.dart' as http;

import '../../db/models/teststructure/test_structure.dart';

class AppDataProvider {
  final dbService = DatabaseService();

  Future<List<TestStructure>> getTestStructureData(
    String testStructureLang,
    String testStructureType,
  ) async {
    try {
      final testStructuresFromDataProvider =
          await dbService.getTestStructureForOne(
        testStructureLang,
        testStructureType,
      );
      return testStructuresFromDataProvider;
    } catch (error) {
      throw error.toString();
    }
  }

  Future<List<TestTypesModel>> getDefaultTestTypesForOneLang(
    String langName,
  ) async {
    try {
      final defaultTestTypesAllDataProvider =
          await dbService.getTestTypesAll(langName);

      return defaultTestTypesAllDataProvider;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<LevelsModel>> getDefaultLevels() async {
    try {
      final defaultLevelsDataProvider = await dbService.getDefaultLevels();
      return defaultLevelsDataProvider;
    } catch (e) {
      throw e.toString();
    }
  }


}
