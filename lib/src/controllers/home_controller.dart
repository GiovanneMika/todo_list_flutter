import 'package:todo_list_flutter/src/models/todo_model.dart';
import 'package:todo_list_flutter/src/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  late final TodoRepository _repository;

  HomeController([TodoRepository? repository]) {
    this._repository = repository ?? TodoRepository();
  }
  Future start() async {
    todos = await _repository.fetchTodos();
  }
}
