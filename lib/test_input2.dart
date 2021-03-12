import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:t4/services/getqcode.dart';

class tinput2 extends StatefulWidget {
  @override
  _tinput2State createState() => _tinput2State();
}

class _tinput2State extends State<tinput2> {
  final t1=new TextEditingController();
  final dbref=FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children:[
          TextField(
            controller: t1,
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: (){
              send();
            },
            child: Text("send"),
          )
        ]
      ),
    );
  }
  void send()async{
    getqcode instance=new getqcode();
    await instance.getcode();
    print(instance.receive);
    // await dbref.child('current_using_qcodes').set({
    //   'name':t1.text
    // });
    // print("done");
  }
}