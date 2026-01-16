import 'package:dio/dio.dart';
import 'package:todo_list_flutter/src/models/todo_model.dart';

class TodoRepository {
  late final Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository([Dio? dio]) {
    this.dio = dio ?? Dio();
  }

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json) => TodoModel.fromJson(json)).toList();

    // modo manual de transformar a lista de json em objetos de Todo
    // List<TodoModel> todos = [];
    // for (var json in list) {
    //   final todo = TodoModel.fromJson(json);
    //   todos.add(todo);
    // }
    // return todos;
  }
}
