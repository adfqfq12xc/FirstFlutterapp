class QuizQuestion {

  QuizQuestion( this.text,  this.answers);

  final String text;
  final List<String> answers;

  List<String> getshuffledAnswers(){
    final shuffledlist=List.of(answers);
    shuffledlist.shuffle();
    return shuffledlist;
  }


}