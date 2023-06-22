import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todo_controller.dart';

class ShowData extends StatelessWidget {
  const ShowData({super.key});
  @override
  Widget build(BuildContext context) {
    Provider.of<TodoController>(context, listen: false).getAllTodos();
    Provider.of<TodoController>(context, listen: false).forMoreData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Provider API'),
      ),
      body: Consumer<TodoController>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            controller: value.scrollController,
            child:Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: value.todos.length + 1,
                  itemBuilder: (context, index) {
                    if(index < value.todos.length) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
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
                        ),
                      );
                    }  else if(index == value.todos.length){
                      return !value.loadData ? const Center(child: Text("No Data Available"),): const Center(child: CircularProgressIndicator());
                    }
                    return null;
                  },
                )
              ],
            ),

          );
        },
      ),
    );
  }
}

//     extends StatefulWidget {
//   const ShowData({super.key});
//
//   @override
//   State<ShowData> createState() => _ShowDataState();
// }

// class _ShowDataState extends State<ShowData> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Provider.of<TodoController>(context, listen: false).getAllTodos();
//       Provider.of<TodoController>(context, listen: false).forMoreData();
//     });
//   }
//
//
// }
