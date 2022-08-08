

import 'package:dictionary_clans/model/wordresponse.dart';
import 'package:dictionary_clans/screens/details/detail_screen.dart';
import 'package:dictionary_clans/screens/home/home_screen.dart';
import 'package:dictionary_clans/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../screens/error_screen.dart';
import '../screens/list/list_screen.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){
    print('This is route: ${settings.name}');
    switch(settings.name){
      case'/':
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case DetailsScreen.routeName:
        return DetailsScreen.route(wordResponse: settings.arguments as WordResponse);
        case ListScreen.routeName:
        return ListScreen.route(words: settings.arguments as  List<WordResponse>);
        case NoWordFound.routeName:
        return NoWordFound.route();

    }
    return _errorRoute();
  }
  static Route _errorRoute(){
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_)=>Scaffold(appBar: AppBar(title: (const Text('Error'))),
        ));
  }
}