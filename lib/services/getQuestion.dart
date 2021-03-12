import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class getQuestion{
  String qCode;var questions;

  getQuestion({this.qCode});

  Future getQ()async{
    await FirebaseDatabase.instance.reference().once().then((DataSnapshot snapshot){
      questions=snapshot.value['questions'][qCode].where((value)=>value!=null).toList();
    });
    
  }

}