
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/provider/todo_controller.dart';
import 'package:providers/screen/home_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TodoController()),
    ],

    child:  const MaterialApp(
        home: HomePage(),
      ));
  }
}