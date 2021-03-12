
import 'package:flutter/material.dart';
import 'package:t4/packages/loading.dart';
import 'package:t4/packages/show_done1.dart';
import 'package:t4/packages/show_question.dart';
import 'package:t4/packages/home.dart';
import 'package:t4/packages/show_useranswer.dart';
import 'package:t4/testdboutput.dart';
import 'package:t4/testdpinput.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'showquestion',
    routes: {
      '/':(context)=>home(),
      'showquestion':(context)=>show_question(),
      'showdone':(context)=>showdone1(),
      'showuseranswer':(context)=>showuseranswer(),
      't1':(context)=>toutput(),
      't2':(context)=>testDb(),
      'loading':(context)=>loading(),
    },
  ));
}

