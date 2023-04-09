import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posts_application/core/theme_app.dart';

Widget LoadingWidget(){
  return Center(
    child: CircularProgressIndicator(color:secondaryColor,),
  );
}