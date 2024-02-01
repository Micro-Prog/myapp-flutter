// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:App/data/data_provider/app_data_provider.dart';
import 'package:App/db/models/levelsmodel/levelsmodel.dart';
import 'package:App/db/service/sqlite_service.dart';

import '../../db/models/teststructure/test_structure.dart';
import '../../db/models/testtypesmodel/testtypesmodel.dart';

class AppRepository {
  final AppDataProvider testingoDataProvider;
  AppRepository(this.testingoDataProvider);
  final dbService = DatabaseService();

  // get test structures
  Future<List<TestStructure>> getTestStructuresOne(
    String testStructureLang,
    String testStructureType,
  ) async {
    final testStructureData = await testingoDataProvider.getTestStructureData(
      testStructureLang,
      testStructureType,
    );
    return testStructureData;
  }

  // default test types
  Future<List<TestTypesModel>> getDefaultTestTypesForOneLang(
    String langName,
  ) async {
    try {
      final defaultTestTypesForOneLang =
          await testingoDataProvider.getDefaultTestTypesForOneLang(langName);

      return defaultTestTypesForOneLang;
    } catch (error) {
      throw error.toString();
    }
  }


  Future<List<LevelsModel>> getDefaultLevels() async {
    try {
      final defaultLevelsData = await testingoDataProvider.getDefaultLevels();
      return defaultLevelsData;
    } catch (e) {
      throw e.toString();
    }
  }
}
