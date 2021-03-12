import 'package:firebase_database/firebase_database.dart';
import 'package:t4/correct_answer.dart';

class getCorrect_answer{
  var answer;String qcode;
  getCorrect_answer({this.qcode});

  Future getCorrectAnswer()async{
    await FirebaseDatabase.instance.reference().once().then((DataSnapshot snapshot){
      answer=snapshot.value['correct_answer'][qcode].where((value)=>value !=null).toList();
    });
  }
}