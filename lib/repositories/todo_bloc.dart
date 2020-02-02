import 'dart:async';
import 'dart:core';
import 'package:simple_todo_app/models/todo.dart';
import 'package:simple_todo_app/repositories/db_provider.dart';

class TodoBloc {

  final _todoController = StreamController<List<Todo>>();
  Stream<List<Todo>> get todoStream => _todoController.stream;

  getTodos() async {
    _todoController.sink.add(await DBProvider.db.getAllTodos());
  }

  TodoBloc() {
    getTodos();
  }

  dispose() {
    _todoController.close();
  }

  create(Todo todo) {
    todo.assignUUID();
    DBProvider.db.createTodo(todo);
    getTodos();
  }

  update(Todo todo) {
    DBProvider.db.updateTodo(todo);
    getTodos();
  }

  delete(String id) {
    DBProvider.db.deleteTodo(id);
    getTodos();
  }
}