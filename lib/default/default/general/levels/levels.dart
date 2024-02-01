class DefaultLevels {
  String langName;
  String name;
  String info;

  DefaultLevels(
      {required this.langName, required this.name, required this.info});
}

List<DefaultLevels> defaultLevels = [
  DefaultLevels(
    langName: 'eng',
    name: 'A1',
    info: 'Basic',
  ),
  DefaultLevels(
    langName: 'eng',
    name: 'A2',
    info: 'Pre Intermediate',
  ),
  DefaultLevels(
    langName: 'eng',
    name: 'B1',
    info: 'Intermediate',
  ),
  DefaultLevels(
    langName: 'eng',
    name: 'B2',
    info: 'Upper Intermediate',
  ),
  DefaultLevels(
    langName: 'eng',
    name: 'C1',
    info: 'Advanced',
  ),
  DefaultLevels(
    langName: 'eng',
    name: 'C2',
    info: 'Proficient',
  ),
];
