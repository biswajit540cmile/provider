import 'package:flutter/material.dart';
import '../model/todo_model.dart';
import '../services/todo_services.dart';

class TodoController extends ChangeNotifier {
  ScrollController scrollController = ScrollController();
  ScrollController scrollController1 = ScrollController();

  final _service = TodoService(); //its the instance of api definition class
 // bool isLoading = false;
  List<Todo> todos = []; //_todos
  var page =1;
  var loadData = true;
  //List<Todo> get todos => _todos; //using Encapsulation
  forMoreData() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
       getAllTodos();
      }
    });
  }
  forMoreData1() {
    scrollController1.addListener(() {
      if (scrollController1.position.maxScrollExtent ==
          scrollController1.position.pixels) {
        getAllTodos();
      }
    });
  }

  Future<void> getAllTodos() async {
    final response = await _service.getAll(page);
if(response.isEmpty){
  loadData = false;
  notifyListeners();
}
else {
  todos.addAll(response); //_todos
  page++;
  notifyListeners();
}
  }
}
TodoController todoController = TodoController();