import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:t4/correct_answer.dart';
import 'package:t4/packages/questions.dart';

class toutput extends StatefulWidget {
  @override
  _toutputState createState() => _toutputState();
}

class _toutputState extends State<toutput> {
  final ref=FirebaseDatabase.instance.reference();
  String x="zuki";final db=FirebaseDatabase.instance.reference();
  List<questions> qf=[];var dReceive;
  void zuki() async{
    correct_answer instance=new correct_answer();
    await instance.correctanswer();
    // await db.once().then((DataSnapshot snapshot){
    //   dReceive=snapshot.value['questions']['qcodes'].where((value)=>value!=null).toList();
    // });
    // for(int i=0;i<dReceive.length;i++){
    //   qf.add(
    //     questions(
    //     choice1: dReceive[i]['c1'],
    //     choice2: dReceive[i]['c2'],
    //     choice3: dReceive[i]['c3'],
    //     choice4: dReceive[i]['c4'],
    //     question: dReceive[i]['question']
    //     )
    //   );
    // }
    // for(int i=0;i<qf.length;i++){
    //   print(qf[i].question);
    // }
    // qf.add(
    //   questions(
    //     choice1: "1",
    //     choice2: "2",
    //     choice3: "3",
    //     choice4: "4",
    //     question: "do u love me?"
    //   )
    // );
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,size){
        return Scaffold(
          appBar: AppBar(
            title: Text(x),
          ),
        );
      },
    );
  }
  @override
  void initState(){
    super.initState ();
    zuki();
    print("hello");
  }
}