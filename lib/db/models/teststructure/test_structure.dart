import 'dart:convert';

class TestStructure {
  final String testStructureId;
  final String testStructureName;
  final String testStructureInfo;
  final String testStructureCode;
  final String testStructureLang;
  final String testStructureType;
  final String testStructureDifficulty;

  TestStructure({
    required this.testStructureId,
    required this.testStructureName,
    required this.testStructureInfo,
    required this.testStructureCode,
    required this.testStructureLang,
    required this.testStructureType,
    required this.testStructureDifficulty,
  });

  TestStructure copyWith({
    String? testStructureId,
    String? testStructureName,
    String? testStructureInfo,
    String? testStructureCode,
    String? testStructureLang,
    String? testStructureType,
    String? testStructureDifficulty,
  }) {
    return TestStructure(
      testStructureId: testStructureId ?? this.testStructureId,
      testStructureName: testStructureName ?? this.testStructureName,
      testStructureInfo: testStructureInfo ?? this.testStructureInfo,
      testStructureCode: testStructureCode ?? this.testStructureCode,
      testStructureLang: testStructureLang ?? this.testStructureLang,
      testStructureType: testStructureType ?? this.testStructureType,
      testStructureDifficulty:
          testStructureDifficulty ?? this.testStructureDifficulty,
    );
  }

  factory TestStructure.fromMap(Map<String, dynamic> map) {
    final getCurrentTestStructures = map['teststructures'];

    return TestStructure(
      testStructureId: getCurrentTestStructures,
      testStructureName: getCurrentTestStructures,
      testStructureInfo: getCurrentTestStructures,
      testStructureCode: getCurrentTestStructures,
      testStructureLang: getCurrentTestStructures,
      testStructureType: getCurrentTestStructures,
      testStructureDifficulty: getCurrentTestStructures,
    );
  }

  factory TestStructure.fromJson(Map<String, dynamic> data) => TestStructure(
        testStructureId: data['testStructureId'],
        testStructureName: data['testStructureName'],
        testStructureInfo: data['testStructureInfo'],
        testStructureCode: data['testStructureCode'],
        testStructureLang: data['testStructureLang'],
        testStructureType: data['testStructureType'],
        testStructureDifficulty: data['testStructureDifficulty'],
      );

  Map<String, dynamic> toMap() => {
        'testStructureId': testStructureId,
        'testStructureName': testStructureName,
        'testStructureInfo': testStructureInfo,
        'testStructureCode': testStructureCode,
        'testStructureLang': testStructureLang,
        'testStructureType': testStructureType,
        'testStructureDifficulty': testStructureDifficulty,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'TestStructure(testStructureId: $testStructureId, testStructureName: $testStructureName, testStructureInfo: $testStructureInfo, testStructureCode: $testStructureCode, testStructureLang: $testStructureLang, testStructureType: $testStructureType, testStructureDifficulty: $testStructureDifficulty)';
  }
}
