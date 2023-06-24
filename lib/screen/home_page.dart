import 'package:flutter/material.dart';
import 'package:providers/provider/todo_controller.dart';
import 'package:providers/screen/show_data_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const ShowData()),
                ),
            child: const Text("Click Me")),
      ),
    );
  }
}
