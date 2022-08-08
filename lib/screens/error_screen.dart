import 'package:dictionary_clans/screens/home/home_screen.dart';
import 'package:dictionary_clans/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoWordFound extends StatelessWidget {
  static const String routeName = '/noDataFound';
  static Route route(){
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_)=>const NoWordFound());
  }
  const NoWordFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                HomeScreen()), (Route<dynamic> route) => false);

          }, icon: const Icon(Icons.arrow_back_ios,
            color: Colors.black,
          ))
        ],

      ),

      body: SizedBox(
        height: double.infinity,
        child: Lottie.asset('assets/94905-404-not-found.json',),
      ),
    );
  }
}
