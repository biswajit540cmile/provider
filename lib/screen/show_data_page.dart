import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/screen/show_data_page_2.dart';
import '../provider/todo_controller.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  late TodoController provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider= Provider.of<TodoController>(context, listen: false);
  }
  // @override
  // void dispose() {
  //   super.dispose();
  //   context.read<TodoController>().dispose();
  //   print("Disposed");
  // }
  @override
  Widget build(BuildContext context) {
    Provider.of<TodoController>(context, listen: false).getAllTodos();
    Provider.of<TodoController>(context, listen: false).forMoreData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:  Consumer<TodoController>(
            builder: (context, value, child){
              return Text('Provider API   ${value.page}');}),

      actions: [
        InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ShowData1(),)),
            child: const Center(child: Text("Next"))),
      ],
      ),
      
      body: Consumer<TodoController>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            controller: value.scrollController,
            child:Column(
              children: [
                Center(child: Text("Track page No. ${value.page}"),),
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
