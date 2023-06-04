import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todo_provider.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Provider API'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, value, child) {
          // If the loading it true then it will show the circular progressbar
          // if (value.isLoading) {
          //   return const Center(
          //     child:  CircularProgressIndicator(),
          //   );
          // }

          // If loading is false then this code will show the list of todo item
          // final todos = value.todos;
          return value.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: value.todos.length,
                  itemBuilder: (context, index) {
                    //  final todo = value.todos[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(value.todos[index].id.toString()),
                      ),
                      title: Text(
                        value.todos[index].title,
                        style: TextStyle(
                          color: value.todos[index].completed
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
