import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todo_controller.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});


   //ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoController>(context, listen: false).getAllTodos();
      Provider.of<TodoController>(context, listen: false).forMoreData();
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Provider API'),
      ),
      body: Consumer<TodoController>(
        builder: (context, value, child) {

          // If the loading it true then it will show the circular progressbar
          // if (value.isLoading) {
          //   return const Center(
          //     child:  CircularProgressIndicator(),
          //   );
          // }
          // If loading is false then this code will show the list of todo item
          // final todos = value.todos;
          return SingleChildScrollView(
              controller: value.scrollController,
           child:Column(
             children: [
               ListView.builder(
                 shrinkWrap: true,
                 physics: ScrollPhysics(),
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
                   }  else if(!value.loadData){
                     Container(
                       height: 10,
                       child: Text("no Data"),
                     );
                     // ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                     //   content: const Text('Yay! A SnackBar!'),
                     //   action: SnackBarAction(
                     //     label: 'Undo',
                     //     onPressed: () {
                     //       // Some code to undo the change.
                     //     },
                     //   ),
                     // ));
                   }
                   else if(value.isLoading) {
                      const Center(
                         child: CircularProgressIndicator() );
                   }
                   // value.loadData ? Container(
                   //     child: const SnackBar(content: Text("Nodata"))):const Center(
                   //   child: CircularProgressIndicator(),

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
