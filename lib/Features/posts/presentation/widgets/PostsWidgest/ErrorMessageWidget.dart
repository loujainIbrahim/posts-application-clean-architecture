import 'package:flutter/cupertino.dart';

Widget ErrorMessageWidget(String message,context){
 return Container(
  height: MediaQuery.of(context).size.height/3,
   child: Center(
     child: SingleChildScrollView(
       child: Text(message),
     ),
   ),
 );

}