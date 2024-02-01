import 'dart:async';

import 'package:App/data/repository/app_repository.dart';
import 'package:App/db/models/levelsmodel/levelsmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:App/db/service/sqlite_service.dart';

import '../db/models/teststructure/test_structure.dart';
import '../db/models/testtypesmodel/testtypesmodel.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppRepository testingoRepository;
  final dbService = DatabaseService();

  AppBloc(this.testingoRepository) : super(AppInitial()) {
    on<DefaultTestStructuresAllInsert>(_defaultTestStructuresAllInsert);
    on<DefaultTestStructuresGet>(_defaultTestStructuresGet);

    on<DefaultLevelsInsert>(_insertDefaultLevels);
    on<DefaultLevelsGet>(_getDefaultLevels);
    on<DefaultTestTypesForAllInsert>(_insertDefaultTestTypesForAll);
    on<DefaultTestTypesForAllGet>(_getDefaultTestTypesForAll);
  }

  void _defaultTestStructuresAllInsert(
    DefaultTestStructuresAllInsert event,
    Emitter<AppState> emit,
  ) async {
    emit(DefaultTestStructuresAllInsertLoading());

    try {
      await dbService.insertTestStructuresAll();
      emit(DefaultTestStructuresAllInsertSuccess(
          message: 'Default Test Structures Inserted Successfully.'));
    } catch (error) {
      emit(DefaultTestStructuresAllInsertFailure(error: error.toString()));
    }
  }

  void _defaultTestStructuresGet(
    DefaultTestStructuresGet event,
    Emitter<AppState> emit,
  ) async {
    emit(DefaultTestStructuresGetLoading());
    await Future.delayed(const Duration(microseconds: 600), () {});

    try {
      final testStructuresOne = await testingoRepository.getTestStructuresOne(
        event.testStructureLang,
        event.testStructureType,
      );
      emit(DefaultTestStructuresGetSuccess(testStructures: testStructuresOne));
    } catch (error) {
      emit(DefaultTestStructuresGetFailure(error: error.toString()));
    }
  }

  void _insertDefaultTestTypesForAll(
    DefaultTestTypesForAllInsert event,
    Emitter<AppState> emit,
  ) async {
    emit(DefaultTestTypesForAllInsertLoading());
    await Future.delayed(const Duration(seconds: 1), () {});

    try {
      await dbService.inserTestTypesAll();

      emit(DefaultTestTypesForAllInsertSuccess(
          message: 'Default Test Types Inserted Successfully.'));
    } catch (error) {
      emit(DefaultTestTypesForAllInsertFailure(error: error.toString()));
    }
  }

  void _getDefaultTestTypesForAll(
    DefaultTestTypesForAllGet event,
    Emitter<AppState> emit,
  ) async {
    emit(DefaultTestTypesForAllGetLoading());
    await Future.delayed(const Duration(milliseconds: 1), () {});

    try {
      final defaultTestTypesforOneLang = await testingoRepository
          .getDefaultTestTypesForOneLang(event.langName);

      emit(DefaultTestTypesForAllGetSuccess(
          testTypes: defaultTestTypesforOneLang));
    } catch (error) {
      emit(DefaultTestTypesForAllGetFailure(error: error.toString()));
    }
  }

  void _insertDefaultLevels(
    DefaultLevelsInsert event,
    Emitter<AppState> emit,
  ) async {
    emit(DefaultLevelsInsertLoading());
    await Future.delayed(const Duration(milliseconds: 150), () {});

    try {
      await dbService.insertDefaultLevels();

      emit(DefaultLevelsInsertSuccess(
          message: " Default Levels Inserted Successfully."));
    } catch (error) {
      emit(DefaultLevelsInsertFailure(error: error.toString()));
    }
  }

  void _getDefaultLevels(
    DefaultLevelsGet event,
    Emitter<AppState> emit,
  ) async {
    emit(DefaultLevelsGetLoading());
    await Future.delayed(const Duration(seconds: 1), () {});

    try {
      final defaultLevels = await testingoRepository.getDefaultLevels();
      emit(DefualtLevelsGetSuccess(defaultLevels: defaultLevels));
    } catch (error) {
      emit(DefaultLevelsGetFailure(error: error.toString()));
    }
  }
}
