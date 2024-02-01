import 'dart:convert';

class LevelsModel {
  final String langName;
  final String name;
  final String info;

  LevelsModel({
    required this.langName,
    required this.name,
    required this.info,
  });

  LevelsModel copyWith({
    String? langName,
    String? name,
    String? info,
  }) {
    return LevelsModel(
      langName: langName ?? this.langName,
      name: name ?? this.name,
      info: info ?? this.info,
    );
  }

  factory LevelsModel.fromMap(Map<String, dynamic> map) {
    final getCurrentLevels = map['levels'];

    return LevelsModel(
      langName: getCurrentLevels,
      name: getCurrentLevels,
      info: getCurrentLevels,
    );
  }

  factory LevelsModel.fromJson(Map<String, dynamic> data) => LevelsModel(
        langName: data['langName'],
        name: data['name'],
        info: data['info'],
      );

  Map<String, dynamic> toMap() => {
        'langName': langName,
        'name': name,
        'info': info,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'LevelsModel(langName: $langName, name: $name, info: $info)';
  }
}
