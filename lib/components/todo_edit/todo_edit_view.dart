import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_todo_app/configs/const_text.dart';
import 'package:simple_todo_app/models/todo.dart';
import 'package:simple_todo_app/repositories/todo_bloc.dart';

class TodoEditView extends StatelessWidget {

  final DateFormat _format = DateFormat("yyyy-MM-dd HH:mm");

  final TodoBloc todoBloc;
  final Todo todo;

  TodoEditView({Key key, @required this.todoBloc, @required this.todo});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ConstText.todoEditView)),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            _titleTextFormField(),
            _dueDateTimeFormField(),
            _noteTextFormField(),
            _confirmButton(context)
          ],
        ),
      )
    );
  }

  Widget _titleTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "タイトル"),
    initialValue: todo.title,
    onChanged: _setTitle,
  );
  
  void _setTitle(String title) {
    todo.title = title;
  }

  // ↓ https://pub.dev/packages/datetime_picker_formfield のサンプルから引用
  Widget _dueDateTimeFormField() => DateTimeField(
    format: _format,
    decoration: InputDecoration(labelText: "締切日"),
    initialValue: todo.dueDate ?? DateTime.now(),
    onChanged: _setDueDate,
    onShowPicker: (context, currentValue) async {
      final date = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        initialDate: currentValue ?? DateTime.now(),
        lastDate: DateTime(2100));
      if (date != null) {
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(
              currentValue ?? DateTime.now()),
        );
        return DateTimeField.combine(date, time);
      } else {
        return currentValue;
      }
    }
  );
 
  void _setDueDate(DateTime dt) {
    todo.dueDate = dt;
  }

  Widget _noteTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "メモ"),
    initialValue: todo.note,
    maxLines: 3,
    onChanged: _setNote,
  );

  void _setNote(String note) {
    todo.note = note;
  }

  Widget _confirmButton(BuildContext context) => RaisedButton.icon(
    icon: Icon(
      Icons.tag_faces,
      color: Colors.white,
    ),
    label: Text("作成"),
    onPressed: () { 
      if (todo.id == null) {
        todoBloc.create(todo);
      } else {
        todoBloc.update(todo);
      }
      
      Navigator.of(context).pop();
    },
    shape: StadiumBorder(),
    color: Colors.green,
    textColor: Colors.white,
  );
}
