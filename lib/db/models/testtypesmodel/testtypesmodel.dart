import 'dart:convert';

class TestTypesModel {
  final String typeCode;
  final String typeName;
  final String typeInfo;
  final String langName;
  final String langInfo;
  final String langCode;

  TestTypesModel({
    required this.typeCode,
    required this.typeName,
    required this.typeInfo,
    required this.langName,
    required this.langInfo,
    required this.langCode,
  });

  TestTypesModel copyWith({
    String? typeCode,
    String? typeName,
    String? typeInfo,
    String? langName,
    String? langInfo,
    String? langCode,
  }) {
    return TestTypesModel(
      typeCode: typeCode ?? this.typeCode,
      typeName: typeName ?? this.typeName,
      typeInfo: typeInfo ?? this.typeInfo,
      langName: langName ?? this.langName,
      langInfo: langInfo ?? this.langInfo,
      langCode: langCode ?? this.langCode,
    );
  }

  factory TestTypesModel.fromMap(Map<String, dynamic> map) {
    final getCurrentTestTypes = map['testtypes'];

    return TestTypesModel(
      typeCode: getCurrentTestTypes,
      typeName: getCurrentTestTypes,
      typeInfo: getCurrentTestTypes,
      langName: getCurrentTestTypes,
      langInfo: getCurrentTestTypes,
      langCode: getCurrentTestTypes,
    );
  }

  factory TestTypesModel.fromJson(Map<String, dynamic> data) => TestTypesModel(
        typeCode: data['typeCode'],
        typeName: data['typeName'],
        typeInfo: data['typeInfo'],
        langName: data['langName'],
        langInfo: data['langInfo'],
        langCode: data['langCode'],
      );

  Map<String, dynamic> toMap() => {
        'typeCode': typeCode,
        'typeName': typeName,
        'typeInfo': typeInfo,
        'langName': langName,
        'langInfo': langInfo,
        'langCode': langCode,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'TestTypesModel(typeCode: $typeCode, typeName: $typeName, typeInfo: $typeInfo, langName: $langName, langInfo: $langInfo, langCode: $langCode)';
  }
}
