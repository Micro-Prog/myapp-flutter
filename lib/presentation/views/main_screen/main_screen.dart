import 'dart:ffi';

import 'package:App/presentation/views/presentation/presentation_screen/presentation_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../bloc/app_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<AppBloc>().add(DefaultTestTypesForAllInsert());
    context.read<AppBloc>().add(DefaultLevelsInsert());

    context.read<AppBloc>().add(DefaultTestStructuresAllInsert());
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MyApp'),
        ),
        backgroundColor: HexColor('#ffffff'),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [],
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: HexColor('#1167d6'),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(20)),
              SafeArea(
                child: Column(
                  children: [
                    Text(
                      'MyApp',
                      style: TextStyle(
                        color: HexColor('#ffffff'),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Home',
                        style: TextStyle(
                          color: HexColor('#ffffff'),
                          fontSize: 18,
                        ),
                      ),
                      selected: _selectedIndex == 0,
                      onTap: () {
                        _onItemTapped(0);
                        Navigator.of(context).pop();
                      },
                    ),
                    ExpansionTile(
                      title: Text(
                        'MyApp',
                        style: TextStyle(
                          color: HexColor('#ffffff'),
                          fontSize: 18,
                        ),
                      ),
                      children: [
                        ListTile(
                          title: Text(
                            'Eng',
                            style: TextStyle(
                              color: HexColor('#ffffff'),
                              fontSize: 14,
                            ),
                          ),
                          selected: _selectedIndex == 1,
                          onTap: () {
                            _onItemTapped(1);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PresentationScreen(
                                  langName: 'eng',
                                  langInfo: 'English',
                                  langCode: '0',
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
