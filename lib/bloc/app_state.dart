// ignore_for_file: override_on_non_overriding_member

part of 'app_bloc.dart';

@immutable
abstract class AppState {

  get defaultLevels => {};
  get testTypes => {};
  get testStructures => {};
}

final class AppInitial extends AppState {}

// insert test structures
final class DefaultTestStructuresAllInsertSuccess extends AppState {
  final String message;

  DefaultTestStructuresAllInsertSuccess({required this.message});
}

final class DefaultTestStructuresAllInsertFailure extends AppState {
  final String error;
  DefaultTestStructuresAllInsertFailure({required this.error});
}

final class DefaultTestStructuresAllInsertLoading extends AppState {}

// test structures get
final class DefaultTestStructuresGetSuccess extends AppState {
  @override
  final List<TestStructure> testStructures;
  DefaultTestStructuresGetSuccess({required this.testStructures});
  @override
  List get props => [testStructures];
}

final class DefaultTestStructuresGetFailure extends AppState {
  final String error;
  DefaultTestStructuresGetFailure({required this.error});
}

final class DefaultTestStructuresGetLoading extends AppState {}

// insert default test types for all langs
final class DefaultTestTypesForAllInsertSuccess extends AppState {
  final String message;

  DefaultTestTypesForAllInsertSuccess({required this.message});
}

final class DefaultTestTypesForAllInsertFailure extends AppState {
  final String error;

  DefaultTestTypesForAllInsertFailure({required this.error});
}

final class DefaultTestTypesForAllInsertLoading extends AppState {}

// default test types get for all
final class DefaultTestTypesForAllGetSuccess extends AppState {
  @override
  final List<TestTypesModel> testTypes;

  DefaultTestTypesForAllGetSuccess({required this.testTypes});
  @override
  List get props => [testTypes];
}

final class DefaultTestTypesForAllGetFailure extends AppState {
  final String error;

  DefaultTestTypesForAllGetFailure({required this.error});
}

final class DefaultTestTypesForAllGetLoading extends AppState {}

// insert eng default levels
final class DefaultLevelsInsertSuccess extends AppState {
  final String message;
  DefaultLevelsInsertSuccess({required this.message});
}

final class DefaultLevelsInsertFailure extends AppState {
  final String error;
  DefaultLevelsInsertFailure({required this.error});
}

final class DefaultLevelsInsertLoading extends AppState {}

// get eng default levels
final class DefualtLevelsGetSuccess extends AppState {
  @override
  final List<LevelsModel> defaultLevels;

  DefualtLevelsGetSuccess({required this.defaultLevels});
}

final class DefaultLevelsGetFailure extends AppState {
  final String error;

  DefaultLevelsGetFailure({required this.error});
}

final class DefaultLevelsGetLoading extends AppState {}
