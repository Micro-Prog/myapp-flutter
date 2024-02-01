import 'package:App/db/models/teststructure/test_structure.dart';

class DefaultTestStructure {
  String testStructureName;
  String testStructureInfo;
  String testStructureCode;
  String testStructureLang;
  String testStructureType;
  String testStructureDifficulty;

  DefaultTestStructure({
    required this.testStructureName,
    required this.testStructureInfo,
    required this.testStructureCode,
    required this.testStructureLang,
    required this.testStructureType,
    required this.testStructureDifficulty,
  });
}

List<TestStructure> testStructuresDefault = [
  TestStructure(
    testStructureId: '9b3915e1-b3da-4b64-b72f-73ed9e7c3124',
    testStructureName: 'mc-4',
    testStructureInfo: 'Multiple Choice Test',
    testStructureCode: '0',
    testStructureLang: 'eng',
    testStructureType: 'grammer',
    testStructureDifficulty: 'A1',
  ),
];
