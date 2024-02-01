part of 'app_bloc.dart';

@immutable
sealed class AppEvent {}

final class DefaultTestStructuresAllInsert extends AppEvent {}

// ignore: must_be_immutable
final class DefaultTestStructuresGet extends AppEvent {
  // ignore: prefer_typing_uninitialized_variables
  var testStructureLang;
  // ignore: prefer_typing_uninitialized_variables
  var testStructureType;
  DefaultTestStructuresGet({
    required this.testStructureLang,
    required this.testStructureType,
  });
}

final class DefaultTestTypesForAllInsert extends AppEvent {}

// ignore: must_be_immutable
final class DefaultTestTypesForAllGet extends AppEvent {
  // ignore: prefer_typing_uninitialized_variables
  var langName;

  DefaultTestTypesForAllGet({required this.langName});
}

final class DefaultLevelsInsert extends AppEvent {}

final class DefaultLevelsGet extends AppEvent {}

