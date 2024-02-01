import 'package:App/db/models/testtypesmodel/testtypesmodel.dart';

class DefaultTestTypes {
  String typeCode;
  String typeName;
  String typeInfo;
  String langName;
  String langInfo;
  String langCode;

  DefaultTestTypes({
    required this.typeCode,
    required this.typeName,
    required this.typeInfo,
    required this.langCode,
    required this.langInfo,
    required this.langName,
  });
}

List<TestTypesModel> testTypesAll = [
  TestTypesModel(
    typeCode: '0',
    typeName: 'grammer',
    typeInfo: 'Grammer',
    langName: 'eng',
    langInfo: 'English',
    langCode: '0',
  ),
  TestTypesModel(
    typeCode: '1',
    typeName: 'vocabulary',
    typeInfo: 'Vocabulary',
    langName: 'eng',
    langInfo: 'English',
    langCode: '0',
  ),
];
