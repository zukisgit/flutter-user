import 'package:firebase_database/firebase_database.dart';

class sendans{
  List ans;
  String user_id,qcode;
  sendans({this.ans,this.user_id,this.qcode});
  final dbref=FirebaseDatabase.instance.reference();

  Future send_answer()async{
    for(int i=0;i<ans.length;i++){
      int tem=int.parse(ans[i].index);
      await dbref.child('user_answers').child(qcode).child(user_id).child('${i+1}').set(
        {
          'answer':ans[i].answer.toString()
        }
        );
        }
  }
}