import 'dart:async';
import 'dart:core';
import 'package:simple_todo_app/models/todo.dart';

class TodoBloc {

  static final List<Todo> sampleTodos = [];

  final _todoController = StreamController<List<Todo>>();
  Stream<List<Todo>> get todoStream => _todoController.stream;

  getTodos() {
    _todoController.sink.add(sampleTodos);
  }

  TodoBloc() {
    getTodos();
  }

  dispose() {
    _todoController.close();
  }

  create(Todo todo) {
    todo.assignUUID();
    sampleTodos.add(todo);
    getTodos();
  }

  update(Todo todo) {
    int _index = sampleTodos.indexWhere((Todo t) => t.id == todo.id);
    if(_index >= 0) {
      sampleTodos[_index] = todo;
      getTodos();
    }
  }

  delete(String id) {
    int _index = sampleTodos.indexWhere((Todo t) => t.id == id);
    if(_index >= 0) {
      sampleTodos.removeAt(_index);
      getTodos();
    }
  }
}