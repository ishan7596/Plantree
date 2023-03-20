
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Utils {

  void toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red.shade300,
        textColor: Colors.white70,
        fontSize: 16.0
    );
  }

   static void fieldFocus(BuildContext context, FocusNode curretNode,FocusNode nextFocus){
       curretNode.unfocus();
       FocusScope.of(context).requestFocus(nextFocus);
   }

}
