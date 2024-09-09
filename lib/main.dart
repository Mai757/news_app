import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/mytheme.dart';
import 'package:news_app/news/NewsDetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        HomeScreen.routeName: (_)=> HomeScreen(),
        NewsDetails.routeName: (_)=> NewsDetails(),

      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.lightTheme,

    );
  }
}


