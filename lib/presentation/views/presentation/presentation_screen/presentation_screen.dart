import 'dart:ffi';

import 'package:App/constants/constants.dart';
import 'package:App/presentation/views/presentation/levels/levels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../bloc/app_bloc.dart';
import '../../main_screen/main_screen.dart';

class PresentationScreen extends StatefulWidget {
  final String langName;
  final String langCode;
  final String langInfo;
  PresentationScreen({
    super.key,
    required this.langName,
    required this.langCode,
    required this.langInfo,
  });

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<AppBloc>()
        .add(DefaultTestTypesForAllGet(langName: widget.langName));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: WillPopScope(
          child: Scaffold(
              appBar: AppBar(
                title: Text('${widget.langInfo}'),
              ),
              body: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
                final testType = state.testTypes;
                if (state is DefaultTestTypesForAllGetLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return ListView.builder(
                  itemCount: testType?.length,
                  itemBuilder: (context, index) {
                    final data = testType?[index];
                    return ListTile(
                        leading: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LevelsScreen(
                              testTypesModel: data,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        color: HexColor('#3d4cf2'),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.width * 0.1,
                        alignment: Alignment.center,
                        child: Text(
                          data.typeInfo.toString(),
                          style: TextStyle(
                            color: HexColor('ffffff'),
                          ),
                        ),
                      ),
                    ));
                  },
                );
              })),
          onWillPop: () async {
            Navigator.pushNamed(context, homescreen);

            return false;
          },
        ));
  }
}
