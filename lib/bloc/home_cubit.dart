import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../model/wordresponse.dart';
import '../repository/dictionary_repo.dart';
import '../screens/error_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  final WordRepository _repository;
  HomeCubit(this._repository) : super(NoWordSearch());
  final queryController = TextEditingController();
  Future getWordSearched() async {
    emit(WordSearching());


    try {

      final words = await _repository.getWordFromDictionary(queryController.text);
       if(words == null) {
         emit(ErrorState('error'));
       }
       else {
         print(words.toString());
         emit(WordSearched(words));
         emit(NoWordSearch());
       }
    } on Exception catch (e) {
     print(e);
     emit(ErrorState(e.toString()));
    }
  }



}
