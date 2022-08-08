part of 'home_cubit.dart';


abstract class HomeState {

}

class NoWordSearch extends HomeState {

}

class WordSearching extends HomeState {

}
class InCorrectWordSearched extends HomeState {

}

class WordSearched extends HomeState {
  final List<WordResponse> words;
  WordSearched(this.words);
}

class ErrorState extends HomeState{
final message;
ErrorState(this.message);
}