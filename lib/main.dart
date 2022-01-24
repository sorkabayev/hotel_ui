import 'package:flutter/material.dart';

import 'home_page.dart';
import 'like_page.dart';
import 'liked_page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const HomePage(),
      routes: {
        HomePage.id: (context)=>  const HomePage(),
        LikePage.id: (context)=> const LikePage(),
        LikePage2.id: (context)=> const LikePage2(),
      },
    );
  }
}