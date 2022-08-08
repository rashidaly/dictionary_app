import 'package:dictionary_clans/model/wordresponse.dart';
import 'package:dictionary_clans/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = '/detailsScreen';
  static Route route({required WordResponse wordResponse}){
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_)=> DetailsScreen(wordResponse: wordResponse,));
  }
  final WordResponse wordResponse;
  const DetailsScreen({Key? key, required this.wordResponse}) : super(key: key);

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
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(title: 'Word Details'),
        body: Container(
          padding: const EdgeInsets.all(32),
          width: double.infinity,
          child: Column(
            children: [
              Text(
                '${wordResponse.word}',
                style: const TextStyle(color: Colors.white, fontSize: 36),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index){
                        final meaning = wordResponse.meanings![index];
                        final definations = meaning.definitions;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(meaning.partOfSpeech,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            ListView.separated
                              (itemBuilder: (context, index) =>
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Definition :${definations[index].definition ?? ''}',
                                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 5),

                                    Text('Sentence :${definations[index].example ?? ''}',
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                separatorBuilder: (context, index)=> const SizedBox(
                                  height: 32,
                                ),
                                itemCount: definations.length,
                              shrinkWrap: true,
                            )


                          ],
                        );

                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                    itemCount: wordResponse.meanings!.length,

                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
