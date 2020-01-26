
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/configs/const_text.dart';
import 'package:simple_todo_app/repositories/todo_bloc.dart';

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
      home: Provider<TodoBloc>(
        create: (context) => new TodoBloc(),
        dispose: (context, bloc) => bloc.dispose(),
        child: TodoListView()
      ),
    );
  }
}