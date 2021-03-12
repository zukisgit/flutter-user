import 'package:flutter/material.dart';
import 'package:t4/correct_answer.dart';
import 'package:t4/packages/loading.dart';
import 'package:t4/packages/questions.dart';
import 'package:t4/packages/save_answer.dart';
import 'package:t4/services/getCorrect_answer.dart';
import 'package:t4/services/getQuestion.dart';
import 'package:t4/services/get_answer.dart';
import 'package:t4/services/getqcode.dart';


class showdone1 extends StatefulWidget {
  @override
  _showdone1State createState() => _showdone1State();
}

class _showdone1State extends State<showdone1> {
  List<questions> question=[];bool check_data_received1=false;int count_correct=0;
  List save_correct=[];String qcode;List<save_answer>user_answer=[];List<save_answer> correct_answer=[];
  void getData()async{
    getqcode instance2=new getqcode();
    await instance2.getcode();
    qcode=instance2.receive['name'];
    getQuestion instance=new getQuestion(qCode: qcode);
    await instance.getQ();
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
    getanswer instance3=new getanswer(qcode: qcode,userid: "001");
    await instance3.getAnswer();
    for(int i=0;i<instance3.answer.length;i++){
      user_answer.add(
        save_answer(index: '${i}',answer: instance3.answer[i]['answer'])
      );
    }
    getCorrect_answer instance4=new getCorrect_answer(qcode: qcode);
    await instance4.getCorrectAnswer();
      for(int i=0;i<instance4.answer.length;i++){
        correct_answer.add(
        save_answer(index: '${i}',answer: instance4.answer[i]['answer'])
      );
    }
    for(int i=0;i<correct_answer.length;i++){
      if(correct_answer[i].answer==user_answer[i].answer){
        save_correct.add('1');
        count_correct++;
      }
      else{
        save_correct.add('0');
      }
    }
    print(save_correct);
    setState(() {
      check_data_received1=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return !check_data_received1?loading(): Scaffold(
      appBar: AppBar(
        title: Row(
          children:[
            Text('Result'),
            SizedBox(width: 10),
            Text('${count_correct} / ${correct_answer.length}')
          ]
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: correct_answer.length,
        itemBuilder: (context,index){
                    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
            child: Card(
              color: save_correct[index]=='1'?Colors.greenAccent:Colors.redAccent,
              child: ListTile(
                onTap: (){
                  Navigator.pushNamed(context,'showuseranswer',arguments: {
                    'no':index+1,
                    'question':question[index].question,
                    'c1':question[index].choice1,
                    'c2':question[index].choice2,
                    'c3':question[index].choice3,
                    'c4':question[index].choice4,
                    'answer':correct_answer[index].answer,
                    'userans':user_answer[index].answer
                  });
                },
                title: Text(question[index].question),
                leading: Text('${index+1}'),
              ),
            ),
          );
        }
        )
    );
  }
  @override
  void initState(){
    super.initState();
    getData();
  }
}