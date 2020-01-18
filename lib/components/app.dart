
import 'package:flutter/material.dart';
import 'package:simple_todo_app/configs/const_text.dart';

import 'todo_list/todo_list_view.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ConstText.appTitle,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      // ダークモード対応
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      home: TodoListView(),
    );
  }
}