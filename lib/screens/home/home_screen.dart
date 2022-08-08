import 'package:dictionary_clans/bloc/home_cubit.dart';
import 'package:dictionary_clans/screens/list/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../error_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeCubit>();
    return
     BlocListener(
      listener: (context, state) {
        if (state is WordSearched) {
          //  Navigator.pushNamed(context, '/listScreen');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ListScreen(words: state.words)));
        }
      },
      bloc: cubit,
      child: Scaffold(
          backgroundColor:  Colors.transparent,
          body:
          cubit.state is WordSearching
              ? Center(
                  child: Container(


                     // padding: const EdgeInsets.all(16),
                      alignment: const Alignment(0.0, -0.49),
                      decoration: BoxDecoration(

                        gradient: LinearGradient(
                          begin: Alignment(-1.0, -0.97),
                          end: Alignment.center,
                          colors: [
                            const Color(0xFF623896).withOpacity(0.93),
                            const Color(0xFF2B174B).withOpacity(0.93)
                          ],
                        ),
                      ),
                      width: double.infinity,
                      height: double.infinity,
                      child: Center
                        (child: Lottie.asset('assets/72785-searching.json'))),
                )
           :    cubit.state is ErrorState
                  ? //showAlert(context)

                  const NoWordFound()
                  : cubit.state is NoWordSearch
                      ? getDictionaryFormWidget(context)
                      : Container()),
    );
  }

  getDictionaryFormWidget(BuildContext context) {
    bool _validate = false;
    final _formKey = GlobalKey<FormState>();
    final cubit = context.watch<HomeCubit>();
    return  Container(
      padding: const EdgeInsets.all(16),
      alignment: const Alignment(0.0, -0.49),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(-1.0, -0.97),
          end: Alignment.center,
          colors: [
            const Color(0xFF623896).withOpacity(0.93),
            const Color(0xFF2B174B).withOpacity(0.93)
          ],
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Spacer(),
            const Text(
              'Dictionary Clans',
              style: TextStyle(
                  color: Colors.greenAccent, fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Search Word',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 32),
            TextField(


              controller: cubit.queryController,
              decoration: InputDecoration(
                hintText: 'Search Word',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                fillColor: Colors.grey[100],
                filled: true,
                prefixIcon: const Icon(Icons.search),
                hintStyle: const TextStyle(color: Colors.black),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent,
                  ),
                  onPressed: () {

                   // cubit.queryController.text.isEmpty ? _validate = true : _validate = false;
                    cubit.getWordSearched();
                  },
                  child:  const Text('SEARCH',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  errorScreen(context){
   return SizedBox(
      height: double.infinity,
      child: Lottie.asset('assets/94905-404-not-found.json',),
    );
  }

   showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
       content: Lottie.asset('assets/94905-404-not-found.json'),

        )
    );
  }
}


