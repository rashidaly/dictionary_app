import 'package:dictionary_clans/screens/details/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


import '../../model/wordresponse.dart';
import '../../widgets/custom_app_bar.dart';

class ListScreen extends StatelessWidget {
  static const String routeName = '/listScreen';
  static Route route({required List<WordResponse> words}){
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_)=>  ListScreen(words: words));
  }
  final List<WordResponse> words;
  const ListScreen({Key? key, required this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(title: 'List',),
      //  backgroundColor: Colors.blueGrey[900],
        body:  listViewdata(context),
      ),
    );
  }
   listViewdata(context){
    return
       ListView.builder(
          itemExtent: 80.0,
          itemCount: words.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.only(top: 20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(wordResponse: words[index])));
                  },
                    child: Neumorphic(
                      style:  NeumorphicStyle(
                          border: NeumorphicBorder(
                            color:  const Color(0XFF5F85DB).withOpacity(0.3),
                           // width: 0.8,
                          )
                      ),

                    child: Center(
                      child: Text(
                        '${index + 1}. ${words[index].word}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF5F85DB),
                        ),
                      ),
                    ),
                  ),
                )
            );

          }
      );

   }
}
