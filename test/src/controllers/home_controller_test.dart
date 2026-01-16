import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list_flutter/src/controllers/home_controller.dart';
import 'package:todo_list_flutter/src/models/todo_model.dart';
import 'package:todo_list_flutter/src/repositories/todo_repository.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

void main() {
  late TodoRepositoryMock repository;
  late HomeController controller;

  setUp(() {
    repository = TodoRepositoryMock();
    controller = HomeController(repository);
  });
  test("Should be able to fill the todo list variable", () async {
    when(() => repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);

    await controller.start();

    expect(controller.todos.isNotEmpty, true);
    expect(controller.todos.length, 1);
  });
}
