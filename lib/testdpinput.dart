import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class testDb extends StatefulWidget {
  // final FirebaseApp app;
  // testDb({this.app});
  @override
  _testDbState createState() => _testDbState();
}

class _testDbState extends State<testDb> {
  final t1Controller=new TextEditingController();
  final t2Controller=new TextEditingController();
  final t3Controller=new TextEditingController();
  final t4Controller=new TextEditingController();
  final t5Controller=new TextEditingController();
  final dbref=FirebaseDatabase.instance.reference();
  var a;int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("Members"),
        backgroundColor: Colors.grey[600],
      ),
      body: Column(
        children: [
          TextField(
            controller: t1Controller,
          ),
          TextField(
            controller: t2Controller,
          ),
          TextField(
            controller: t3Controller,
          ),
          TextField(
            controller: t4Controller,
          ),
          TextField(
            controller: t5Controller,
          ),
          FlatButton(
            color: Colors.grey[300],
            onPressed: ()async{
              await dbref.once()
              .then((DataSnapshot snapshot){
                if (snapshot.value==null){
                  count=0;
                }else{
                    a=snapshot.value['questions']['qcodes'].where((value)=>value!=null).toList();
                    count=a.length;
                }
              });
              await dbref.child('questions').child('qcodes').child('${count+1}').set({
                'question':t1Controller.text,
                'c1':t2Controller.text,
                'c2':t3Controller.text,
                'c3':t4Controller.text,
                'c4':t5Controller.text,
              });
              print("done");
              // dbref
              // .child('questions')
              // .push()
              // .child('qcodes')
              // .push()
              // .child('1')
              // .push()
              // .set(t1Controller.text)
              // .asStream();
            },
            child: Text("save")
            ),
            // FlatButton(
            //   onPressed: ()async{
            //     await ref.child('members').orderByChild('g1').once().then((DataSnapshot snapshot){
            //       values=snapshot.value as Map;
            //     });
            //     var list=values.values.toList();
            //     print(list[0]['names']);
            //   },
            //   child: Text("show"),
            //   )
        ]
        ,),
    );
  }
}