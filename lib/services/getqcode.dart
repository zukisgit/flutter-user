import 'package:firebase_database/firebase_database.dart';

class getqcode{
var receive;

  Future getcode()async{
    await FirebaseDatabase.instance.reference().once().then((DataSnapshot snapshot) {
      receive=snapshot.value['current_using_qcodes'];
    });
  }

}