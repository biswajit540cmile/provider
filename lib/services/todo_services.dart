import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/todo_model.dart';

class TodoService {
  Future<List<Todo>> getAll(int page) async {
    var url = 'https://jsonplaceholder.typicode.com/todos?_page=$page&_size=10';
    //print(page);
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
        final todos = json.map((e) {
          return Todo(
            id: e['id'],
            title: e['title'],
            userId: e['userId'],
            completed: e['completed'],
          );
        }).toList();
       // page++;
        return todos;

    }
    return [];
  }
}