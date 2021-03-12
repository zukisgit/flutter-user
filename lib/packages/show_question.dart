import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:t4/correct_answer.dart';
import 'package:t4/packages/loading.dart';
import 'package:t4/packages/questions.dart';
import 'package:t4/packages/save_answer.dart';
import 'package:t4/services/getQuestion.dart';
import 'package:t4/services/getqcode.dart';
import 'package:t4/services/send_ans.dart';

class show_question extends StatefulWidget {
  @override
  _show_questionState createState() => _show_questionState();
}

class _show_questionState extends State<show_question> with TickerProviderStateMixin{
  List<questions>question=[];
  // List<questions> question=[
  //   questions(id: '1',question: '__ に(のぼります)登ります。',choice1: "川",choice2: "山",choice3: "海",choice4: "土"),
  //   questions(id: '2',question: '(えき)駅の __ にあいましょう。',choice1: "まえ",choice2: "うしろ",choice3: "むき",choice4: "した"),
  //   questions(id: '3',question: 'あさっては土曜日ですからきょうは __ です。',choice1: "月曜日",choice2: "きんようび",choice3: "木曜日",choice4: "水曜日"),
  //   questions(id: '4',question: 'お風呂(おふろ)に __。',choice1: "はいります",choice2: "でます",choice3: "いいます",choice4: "あらいます"),
  //   questions(id: '5',question: 'クルトくんは今 __ ですか? 26さいです。',choice1: "いくら",choice2: "だれ",choice3: "なんかい",choice4: "おいくつ"),
  // ];
String pressAttention;var q;var qcode;bool send_or_not=false;String userid="001";
int q_count=0;bool check_data_received=false;var rData;var answer;bool check_full=false;
  void get_data()async{
    try{
    getqcode instance2=new getqcode();
    await instance2.getcode();
    qcode=instance2.receive['name'];
    getQuestion instance=new getQuestion(qCode: qcode);
    await instance.getQ();
    answer=new List(instance.questions.length);
    for(int i=0;i<instance.questions.length;i++){
      question.add(
        questions(
          id: '${i+1}',
          question: instance.questions[i]['question'],
          choice1: instance.questions[i]['c1'],
          choice2: instance.questions[i]['c2'],
          choice3: instance.questions[i]['c3'],
          choice4: instance.questions[i]['c4'],
        )
      );
    }
    correct_answer instance3=new correct_answer();
    await instance3.correctanswer();
    setState(() {
      check_data_received=true;
    });
    }catch(e){
      print("couldn't get data");
    }
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,size){
    return Scaffold(
    backgroundColor: Colors.grey,
    appBar: AppBar(
      title: Text("zuki's test"),
      centerTitle: true,
      backgroundColor: Colors.grey[600],
    ),
    body:!check_data_received?loading(): Builder(
      builder: (context)=>
    Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,60,0,0),
            child: Container(
              height: 80,width: 390,
              child: Text(
                question[q_count].question,
                style: TextStyle(
                    fontSize: 19
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.only(
                      topLeft:  const Radius.circular(5),
                      topRight: const Radius.circular(5),
                      bottomLeft: const Radius.circular(0),
                      bottomRight: const Radius.circular(0),
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
              topLeft: const Radius.circular(0),
              topRight: const Radius.circular(0),
              bottomLeft: const Radius.circular(5),
              bottomRight: const Radius.circular(5),
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
                        " A:"+question[q_count].choice1
                    ),
                  ),
                  Container(
                    width: 195,height: 40,
                    child: Text(" C:"+question[q_count].choice3),
                  )
                ],
              ),
              Expanded(
                                child: Column(
                  children: [
                    Container(
                      width: 195,height: 40,
                      child: Text("B:"+question[q_count].choice2),
                      decoration: BoxDecoration(
                          color: Colors.grey[100]
                      ),
                    ),
                    Container(
                      width: 195,height: 40,
                      child: Text("D:"+question[q_count].choice4),
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
        SizedBox(height: 10,),
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
                    color: pressAttention=='1'? Colors.amber:Colors.grey[300],
                    child: Text(
                      "A",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onPressed: (){
                      press('1');
                      if(check_full){
                        finish_message(context);
                      }
                    },
                  ),
                ),
                                 ButtonTheme(
                  minWidth: 100.0,
                  height: 45,
                  child: FlatButton(
                    color: pressAttention=='3'? Colors.amber:Colors.grey[300],
                    child: Text(
                      "C",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onPressed: (){
                      press('3');
                      if(check_full){
                        finish_message(context);
                      }
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
                    color: pressAttention=='2'? Colors.amber:Colors.grey[300],
                    child: Text(
                      "B",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onPressed: (){
                      press('2');
                      if(check_full){
                        finish_message(context);
                      }
                    },
                  ),
                ),
                                 ButtonTheme(
                  minWidth: 100.0,
                  height: 45,
                  child: FlatButton(
                    color: pressAttention=='4'? Colors.amber:Colors.grey[300],
                    child: Text(
                      "D",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onPressed: (){
                      press('4');
                      if(check_full){
                        finish_message(context);
                      }
                    },
                  ),
                ),
              ]
            )
          ]
        ),
        SizedBox(height: 10,),
         Row(
            children: [
              SizedBox(width:15),
               Expanded(
                                  child: Container(
                   child: FlatButton.icon(
                        onPressed:(){
                          backward();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.amber,
                          size: 50,
                        ),
                        label: Text(
                          "",
                        )
                    ),
                 ),
               ),
               Container(child: Text('${q_count+1}'+' / '+'${question.length}')),
               SizedBox(width:10),
              Expanded(
                                child: Container(
                  child: FlatButton.icon(
                      onPressed:(){
                        forward();
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.amber,
                        size: 50,
                      ),
                      label: Text(
                        "",
                      )
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
        Container(
          child: ClipOval(
            child: Material(
              color: Colors.grey[700],
              child: InkWell(
                splashColor: !check_full?Colors .redAccent:Colors.amber,
                child: SizedBox(width: 60,height: 60,child: Icon(
                    Icons.check,
                  color: !check_full?Colors.redAccent:Colors.amber,
                ),),
                onTap: (){
                  check_answer_full_or_not(context);
                },
              ),
            ),
          ),
        )
      ],
    ),
    ));
    });
  }
  void forward(){
    setState(() {
      q_count++;
      check_forward();
      check_null_or_not();
    });
  }
  void backward(){
    setState(() {
      q_count--;
      check_backward();
      check_null_or_not();
    });
  }
  void showToast(BuildContext context){
    final scaffold=Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text(
            "Answer all question",
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.grey[700],
      )
    );
  }
  void finish_message(BuildContext context){
    final scaffold=Scaffold.of(context);
    scaffold.showSnackBar(
        SnackBar(
          content: const Text(
            "If you want to finish  press CHECK button",
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.grey[700],
        )
    );
  }
  void send_answer_loading(BuildContext context)async{
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context){
            return new WillPopScope(
              onWillPop: () {  },
              child: SimpleDialog(
                backgroundColor: Colors.black45,
                children: [
                  Center(
                    child: SpinKitDoubleBounce (
                      color: Colors.grey[300],
                      size: 70,
                      ),
                  )
                ],
              ),
            );
          }
      ) ;
      sendans instance =new sendans(ans: answer,user_id: userid,qcode: qcode);
      await instance.send_answer();
      Navigator.pushNamedAndRemoveUntil(context, 'showdone', ModalRoute.withName('/'));
  }
  void press(String attention){
    setState(() {
      save(attention);
      pressAttention=attention;
    });
  }
  void save(String ans){
    answer[q_count]=save_answer(index: '${q_count}',answer: ans);
    check_answer_f();
  }
  check_null_or_not(){
    if(answer[q_count]!=null){
      pressAttention='${answer[q_count].answer}';
    }
    else{
      pressAttention='0';
    }
  }
  check_forward(){
    q_count=q_count==question.length?0:q_count;
  }
  check_backward(){
    q_count=q_count<0?question.length-1:q_count;
  }
  check_answer_full_or_not(context){
    if(!check_full) {
      showToast(context);
    }
    else{
      showDialog(
          context: context,
          builder: (_)=>AlertDialog(
            title: Text('Comfirm'),
            content: Text("Are you sure to finish?"),
            actions: [
              FlatButton(
                child: Text("no"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("yes"),
                onPressed: (){
                  Navigator.of(context).pop();
                  send_answer_loading(context);
                },
              ),
            ],
          )
      );
    }
  }
  void check_answer_f(){
    int check_null=0;
    int check_ans=0;
    for(int i=0;i<answer.length;i++){
      if(answer[i]==null){
        check_null+=1;
      }else{
        check_ans+=1;
      }
    }
    if(check_null==0){
      check_full=true;
    }
    else(check_full=false);
  }
  @override
  void initState(){
    super.initState();
    get_data();
  }
}
