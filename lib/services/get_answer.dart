import 'package:firebase_database/firebase_database.dart';

class getanswer{
String qcode;String userid;var answer;
  getanswer({this.qcode,this.userid});

  Future getAnswer() async{
    await FirebaseDatabase.instance.reference().once().then((DataSnapshot snapshot){
      answer=snapshot.value['user_answers'][qcode][userid].where((value)=>value!=null).toList();
    });
  }
}