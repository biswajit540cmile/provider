import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:providers/screen/home_page.dart';

import 'provider/todo_provider.dart';
import 'screen/show_data_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}