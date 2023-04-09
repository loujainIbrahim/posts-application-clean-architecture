
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_application/Features/posts/presentation/bloc/AddDeleteUpdate/add_delete_update_bloc.dart';
import 'package:posts_application/dependency_injection.dart';

import 'Features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'Features/posts/presentation/pages/PostsPage.dart';
import 'core/theme_app.dart';
import 'dependency_injection.dart'as di;

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(providers:
       [ BlocProvider(
          create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())
        ),
       BlocProvider(create: (_)=>di.sl<AddDeleteUpdateBloc>())
       ],
         child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'Posts App',
        home: PostsPage()));
  }
}
