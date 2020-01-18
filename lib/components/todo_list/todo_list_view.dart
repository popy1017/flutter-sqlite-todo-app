import 'package:flutter/material.dart';
import 'package:simple_todo_app/configs/const_text.dart';
import 'package:simple_todo_app/models/todo.dart';

class TodoListView extends StatefulWidget {
  @override
  _TodoListView createState() => _TodoListView();
}

class _TodoListView extends State<TodoListView> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ConstText.todoListView)),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          Todo todo = Todo(
            "タイトル $index",
            DateTime.now(),
            "タイトル $index のメモです。タイトル $index のメモです。"
          );
          
          return Card(
            child: ListTile(
              onTap: (){},
              title: Text("${todo.title}"),
              subtitle: Text("${todo.note}"),
              trailing: Text("${todo.dueDate.toLocal().toString()}"),
              isThreeLine: true,
            )
          );
        },
      ),
    );
  }
}