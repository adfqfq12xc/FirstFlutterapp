import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/questions.dart';


class Questions extends StatefulWidget {
  const Questions( {super.key, required this.onselectedanswer});
final void Function(String) onselectedanswer;
  @override
  State<Questions> createState() => _QuestionsState();

}

class _QuestionsState extends State<Questions> {

var currindexx=0;

    void answerquestion(String answer){
      log(answer);
      widget.onselectedanswer(answer);

      setState(() {
        currindexx +=1;
      });
  
}
  @override
  Widget build(BuildContext context) {
      final curr=questions[currindexx];

    return Container(
      margin:const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            curr.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
           const SizedBox(height: 30),
          ...curr.getshuffledAnswers().map((answer){
            return Container(
              margin:const EdgeInsets.all(10),
                    child: ElevatedButton(
              
              style: ElevatedButton.styleFrom(
              
                backgroundColor: const Color.fromARGB(255, 128, 198, 255).withOpacity(0.6),
                foregroundColor: Colors.white.withOpacity(0.65),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onPressed:(){
               answerquestion(answer);
              }  ,
              child: Text(answer,textAlign: TextAlign.center,),
            ),
            );
      
          }),
     
      
        ],
      ),
    );
  }
}
