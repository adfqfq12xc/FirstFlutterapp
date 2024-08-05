import 'package:flutter/material.dart';

class Home extends StatelessWidget {
   Home(this.switchscreen,{super.key});

  void Function() switchscreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       Opacity(opacity: 0.2 ,child: Image.asset('assets/images/quiz-logo.png',width: 300,),), 
       const SizedBox(height: 40,),
        const Text('Learn Flutter',style: TextStyle(fontSize: 24,color: Colors.white),),
        OutlinedButton.icon(style: OutlinedButton.styleFrom(foregroundColor: Colors.white) ,
        
        icon:const Icon(Icons.arrow_right),onPressed: switchscreen, label: const Text('Start Quiz'))
      ],),
      
    );
  }
}