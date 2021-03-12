import 'package:flutter/material.dart';

class showuseranswer extends StatefulWidget {
  @override
  _showuseranswerState createState() => _showuseranswerState();
}

class _showuseranswerState extends State<showuseranswer> {

  var answer=new List(5);int pressAttention;Map data={};
  int q_count=0;int check_answer=0;var rData;

  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('${data['no']}'),
        centerTitle: true,
        backgroundColor: Colors.grey[600],
      ),
      body: Column(
      children: [
            Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,60,0,0),
              child: Container(
                height: 80,width: 390,
                child: Text(
                  data['question'],
                  style: TextStyle(
                      fontSize: 19
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                        topLeft:  const Radius.circular(5),
                        topRight: const Radius.circular(5)
                    ),
                    color: Colors.grey[100],
                ),
              ),
            ),
          ),
          Container(
            width: 390,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: new BorderRadius.only(
                bottomRight: const Radius.circular(5),
                bottomLeft: const Radius.circular(5)
              )
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Container(
                      width: 195,height: 40,
                      child: Text(
                          " A:"+data['c1']
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey[100]
                      ),
                    ),
                    Container(
                      width: 195,height: 40,
                      child: Text(" C:"+data['c3']),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: new BorderRadius.only(
                            bottomLeft: const Radius.circular(5),
                          )
                      ),
                    )
                  ],
                ),
                Expanded(
                                  child: Column(
                    children: [
                      Container(
                        width: 195,height: 40,
                        child: Text("B:"+data['c2']),
                        decoration: BoxDecoration(
                            color: Colors.grey[100]
                        ),
                      ),
                      Container(
                        width: 195,height: 40,
                        child: Text("D:"+data['c4']),
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.only(
                              bottomRight: const Radius.circular(5),
                            ),
                            color: Colors.grey[100]
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children:[
              Column(
                children:[
                 ButtonTheme(
                    minWidth: 100.0,
                    height: 45,
                    child: FlatButton(
                      color: data['answer']=='1'&&data['userans']=='1'?Colors.greenAccent:data['userans']=='1'?Colors.redAccent:data['answer']=='1'?Colors.amber:Colors.grey[300],
                      child: Text(
                        "A",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      onPressed: (){
                      },
                    ),
                  ),
                                   ButtonTheme(
                    minWidth: 100.0,
                    height: 45,
                    child: FlatButton(
                      color: data['answer']=='3'&&data['userans']=='3'?Colors.greenAccent:data['userans']=='3'?Colors.redAccent:data['answer']=='3'?Colors.amber:Colors.grey[300],
                      child: Text(
                        "C",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      onPressed: (){
                      },
                    ),
                  ),
                ]
              ),
              SizedBox(width:10),
              Column(
                children:[
                 ButtonTheme(
                    minWidth: 100.0,
                    height: 45,
                    child: FlatButton(
                      color: data['answer']=='2'&&data['userans']=='2'?Colors.greenAccent:data['userans']=='2'?Colors.redAccent:data['answer']=='2'?Colors.amber:Colors.grey[300],
                      child: Text(
                        "B",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      onPressed: (){
                      },
                    ),
                  ),
                                   ButtonTheme(
                    minWidth: 100.0,
                    height: 45,
                    child: FlatButton(
                      color: data['answer']=='4'&&data['userans']=='4'?Colors.greenAccent:data['userans']=='4'?Colors.redAccent:data['answer']=='4'?Colors.amber:Colors.grey[300],
                      child: Text(
                        "D",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      onPressed: (){
                      },
                    ),
                  ),
                ]
              )
            ]
          ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              child: Container(
                child: SizedBox(
                  width: 20,height: 20,
                  child: const DecoratedBox(
                      decoration:const BoxDecoration(
                          color: Colors.redAccent
                      ) ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Container(child: Text("Your Answer")),
            SizedBox(width: 10,),
            Container(
              child: SizedBox(
                width: 20,height: 20,
                child: const DecoratedBox(
                    decoration:const BoxDecoration(
                        color: Colors.amber
                    ) ),
              ),
            ),
            SizedBox(width: 10,),
            Container(child: Text("Correct Answer")),
            SizedBox(width: 10,),
            Container(
              child: SizedBox(
                width: 20,height: 20,
                child: const DecoratedBox(
                    decoration:const BoxDecoration(
                        color: Colors.greenAccent
                    ) ),
              ),
            ),
            Container(child: SizedBox(width: 10,)),
            Container(child: Expanded(child: Text("You are Right")))
          ],
        )
      ],
      ),
    );
  }
}
