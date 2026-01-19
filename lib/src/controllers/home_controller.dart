import 'package:flutter/foundation.dart';
import 'package:todo_list_flutter/src/models/todo_model.dart';
import 'package:todo_list_flutter/src/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  // HomeState state = HomeState.initial;
  late final TodoRepository _repository;
  late final state = ValueNotifier<HomeState>(HomeState.initial);

  HomeController([TodoRepository? repository]) {
    _repository = repository ?? TodoRepository();
  }
  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await _repository.fetchTodos();
      state.value = HomeState.success;
    } on Exception catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { initial, loading, success, error }
