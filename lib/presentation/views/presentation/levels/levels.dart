import 'dart:math';

import 'package:App/presentation/views/presentation/presentation_screen/presentation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/app_bloc.dart';
import '../../../../db/models/testtypesmodel/testtypesmodel.dart';

class LevelsScreen extends StatefulWidget {
  final TestTypesModel testTypesModel;
  const LevelsScreen({Key? key, required this.testTypesModel})
      : super(key: key);

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppBloc>(context).add(DefaultLevelsGet());

    BlocProvider.of<AppBloc>(context).add(DefaultTestStructuresGet(
      testStructureLang: widget.testTypesModel.langName,
      testStructureType: widget.testTypesModel.typeName,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.testTypesModel.typeName.toString()),
          ),
          body: BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              // Check for the specific state you want to handle
              if (state is DefaultLevelsGetLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              final data = state.defaultLevels;
              final dataLength = data?.length;
              final dds = state.testStructures;

              final testStructuresData = dds;
              print(testStructuresData);

              return BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  final dds = state.testStructures;

                  final testStructuresData = dds;
                  return ListView.builder(
                    itemCount: dataLength,
                    itemBuilder: (context, index) {
                      final d = data[index];
                      final testStructuresDataForListView =
                          testStructuresData[index];
                      return ExpansionTile(
                        title: Text(d.name.toString()),
                        subtitle: Text(d.info.toString()),
                        children: [
                          ListTile(
                            title: Text(
                              testStructuresDataForListView
                                      ?.testStructureInfo ??
                                  'no info',
                            ),
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => CartsScreen(
                              //       level: data[index],
                              //       testType: widget.testTypesModel,
                              //     ),
                              //   ),
                              // );
                            },
                          )
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              // Add your logic for FloatingActionButton onPressed
            },
          ),
        ),
        onWillPop: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PresentationScreen(
                langName: widget.testTypesModel.langName,
                langInfo: widget.testTypesModel.langInfo,
                langCode: widget.testTypesModel.langCode,
              ),
            ),
          );
          return true;
        },
      ),
    );
  }
}
