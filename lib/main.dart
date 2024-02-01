import 'package:App/bloc/app_bloc.dart';
import 'package:App/data/data_provider/app_data_provider.dart';
import 'package:App/data/repository/app_repository.dart';

import 'package:App/presentation/views/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AppRepository(
        AppDataProvider(),
      ),
      child: BlocProvider(
        create: (context) => AppBloc(
          context.read<AppRepository>(),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'تستینگو',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const Directionality(
            textDirection: TextDirection.rtl,
            child: HomeScreen(),
          ),
          routes: {
            homescreen: (context) => const HomeScreen(),
          },
        ),
      ),
    );
  }
}
