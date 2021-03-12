import 'package:firebase_database/firebase_database.dart';

class correct_answer{
  String index,answer;int j=2;

  Future correctanswer()async{
      await FirebaseDatabase.instance.reference().child('correct_answer').child('qcodes').child('${3}').set(
        {
          'answer':'3'
          }
          );
      await FirebaseDatabase.instance.reference().child('correct_answer').child('qcodes').child('${4}').set(
        {
          'answer':'1'
          }
          );
      await FirebaseDatabase.instance.reference().child('correct_answer').child('qcodes').child('${5}').set(
        {
          'answer':'4'
          }
          );
  }

}