import 'package:dictionary_clans/bloc/home_cubit.dart';
import 'package:dictionary_clans/config/app_router.dart';
import 'package:dictionary_clans/repository/dictionary_repo.dart';
import 'package:dictionary_clans/screens/home/home_screen.dart';
import 'package:dictionary_clans/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(WordRepository()),
      child: MaterialApp(
        title: 'Dictionary Clan',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: const SplashScreen(),
      //initialRoute: SplashScreen.routeName,

      /*  home: BlocProvider(
          child: const SplashScreen(),
          create: (context) => HomeCubit(WordRepository()),
        ),*/
      ),
    );
  }
}

