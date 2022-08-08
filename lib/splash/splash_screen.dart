

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dictionary_clans/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  static Route route(){
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context)=> const SplashScreen());
  }
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: const Alignment(0.0, -0.49),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.0, -0.97),
            end: Alignment.center,
            colors: [
              const Color(0xFF3A166F).withOpacity(0.93),
              const Color(0xFF675094).withOpacity(0.93)
            ],
          ),
        ),
        child:
        Stack(
          children: [
            AnimatedSplashScreen(
              backgroundColor: Colors.transparent,
                splash: Lottie.asset('assets/8852-searching-for-word.json'),
                splashIconSize: 250,
               nextScreen: const HomeScreen(),
            ),

       const Padding(
         padding: EdgeInsets.only(bottom: 200.0),
         child: Center(
                  child: Text('Dictionary Clans',
                  style: TextStyle(color: Colors.greenAccent,
                  fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                  ),

              ),
       )
          ],
        ),
      ),

    );
  }
}
