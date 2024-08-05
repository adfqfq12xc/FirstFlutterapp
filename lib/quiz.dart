import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/questions.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/questions.dart';
import 'package:flutter_application_2/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activescreen;
   List<String> selectedanswer=[];

  void chooseanswer(String answer){
    selectedanswer.add(answer);
    if(selectedanswer.length==questions.length){
      setState(() {
        activescreen= Result(selectedanswerr:selectedanswer,switchscreen:switchscreen);
        selectedanswer=[];
      });
    }
  }
 @override
  void initState() {
    super.initState();
      activescreen=Home(switchscreen);
  }
        void switchscreen(){
setState(() {
  activescreen= Questions(onselectedanswer:chooseanswer) ;
});
  }

  
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.deepPurple],
            ),
          ),
          child:  activescreen, // Add this line
        ),
      ),
    );
  }
}