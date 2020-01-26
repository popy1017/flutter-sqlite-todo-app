import 'package:uuid/uuid.dart';

class Todo {
  String id;
  String title;
  DateTime dueDate;
  String note;

  Todo(this.title, this. dueDate, this.note) {
    this.id = this.assignUUID();
  }
  Todo.newTodo() {
    title = "";
    dueDate = DateTime.now();
    note = "";
  }

  assignUUID() {
    id = Uuid().v4();
  }
}