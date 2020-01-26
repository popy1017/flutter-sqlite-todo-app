import 'package:uuid/uuid.dart';

class Todo {
  String id;
  String title;
  DateTime dueDate;
  String note;

  Todo(this.title, this. dueDate, this.note);
  Todo.newTodo() {
    title = "";
    dueDate = DateTime.now();
    note = "";
  }

  Todo clone() {
    Todo newTodo = Todo(title, dueDate, note);
    newTodo.id = id;
    return newTodo;
  }

  assignUUID() {
    id = Uuid().v4();
  }
}