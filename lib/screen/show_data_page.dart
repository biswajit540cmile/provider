import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/screen/show_data_page_2.dart';
import '../provider/todo_controller.dart';

class ShowData extends StatelessWidget {
  const ShowData({super.key});

  @override
  Widget build(BuildContext context) {
    /// Here Provider.of<TodoController>(context,listen: false) is
    /// used to access the TodoController Instance methods
    ///
    /// listen = false (only read the value and rebuild manually as per requirement)
    /// listen = true (The widget will automatically rebuild when the data changes)
    ///
    /// Provider.of<TodoController>(context,listen: false) == context.read<TodoController>()
    /// Provider.of<TodoController>(context,listen: true) == context.watch<TodoController>()
    Provider.of<TodoController>(context,listen: false).getAllTodos();
    context.read<TodoController>().forMoreData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        ///Consumer is a widget helps to redrawn the specific widget
        ///context => Define the position of widget in a widget tree
        /// value => access the current state value
        ///It is used to reduce the amount of code that needs to be repeated when using Consumer multiple times
        title: Consumer<TodoController>(builder: (context, value, _) {
          return Text('Provider API   ${value.page} ${_}');
        }),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShowData1(),
                    )),
                child: const Center(child: Text("Next"))),
          ),
        ],
      ),

      ///In getX using like OBX
      body: Consumer<TodoController>(
        ///context for widget Position
        ///value to access the
        builder: (context, value, child) {
          return SingleChildScrollView(
            controller: value.scrollController,
            child: Column(
              children: [
                Center(
                  child: Text("Track page No. ${value.page}"),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: value.todos.length + 1,
                  itemBuilder: (context, index) {
                    if (index < value.todos.length) {
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
                    } else if (index == value.todos.length) {
                      return !value.loadData
                          ? const Center(
                              child: Text("No Data Available"),
                            )
                          : const Center(child: CircularProgressIndicator());
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
