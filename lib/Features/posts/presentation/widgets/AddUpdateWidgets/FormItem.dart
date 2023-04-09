import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormItem extends StatelessWidget {
   FormItem({Key? key,  required this.controller, required this.isTitle }) : super(key: key);
  final bool isTitle;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        maxLines:isTitle?1:6,
        validator: (value){
          if(value!.isEmpty){
            return 'can\'t be empty' ;
          }
          return null;
        },
        decoration:  InputDecoration(hintText: isTitle?"title":"body"),
      ),
    );
  }
}
