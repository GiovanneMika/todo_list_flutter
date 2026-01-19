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
    when(() => repository.fetchTodos()).thenAnswer(
      (_) async => [
        TodoModel(userId: 1, id: 1, title: "Test Todo", completed: false),
      ],
    );

    expect(controller.state, HomeState.initial);
    await controller.start();

    print(controller.todos[0].toJson());

    expect(controller.todos.isNotEmpty, true);
    expect(controller.todos.length, 1);
    expect(controller.state, HomeState.success);
  });
  test("Should be able to change the state to error if the request fails", () async {
    when(() => repository.fetchTodos()).thenThrow(Exception());

    expect(controller.state, HomeState.initial);
    await controller.start();

    expect(controller.state, HomeState.error);
  });
}
