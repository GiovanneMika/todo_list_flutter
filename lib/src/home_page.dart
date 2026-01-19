import 'package:flutter/material.dart';
import 'package:todo_list_flutter/src/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _success() {
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (context, index) {
        var todo = controller.todos[index];
        return ListTile(
          leading: Checkbox(value: todo.completed, onChanged: (value) {}),
          title: Text('${controller.todos[index].title}'),
        );
      },
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start();
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: Text("Tentar novamente"),
      ),
    );
  }

  _loading() {
    return Center(child: CircularProgressIndicator(color: Colors.grey));
  }

  _initial() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.initial:
        return _initial();

      case HomeState.loading:
        return _loading();

      case HomeState.success:
        return _success();

      case HomeState.error:
        return _error();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Afazeres"),
        actions: [
          IconButton(
            onPressed: () {
              controller.start();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
