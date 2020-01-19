import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_todo_app/configs/const_text.dart';

class TodoEditView extends StatefulWidget {
  @override 
  _TodoEditView createState() => _TodoEditView();
}

class _TodoEditView extends State<TodoEditView> {

  final DateFormat _format = DateFormat("yyyy-MM-dd HH:mm");

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
            _confirmButton()
          ],
        ),
      )
    );
  }

  Widget _titleTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "タイトル"),
    initialValue: "",
  );

  // ↓ https://pub.dev/packages/datetime_picker_formfield のサンプルから引用
  Widget _dueDateTimeFormField() => DateTimeField(
    format: _format,
    decoration: InputDecoration(labelText: "締切日"),
    initialValue: DateTime.now(),
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

  Widget _noteTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "メモ"),
    initialValue: "",
    maxLines: 3,
  );

  Widget _confirmButton() => RaisedButton.icon(
    icon: Icon(
      Icons.tag_faces,
      color: Colors.white,
    ),
    label: Text("作成"),
    onPressed: () { 
      Navigator.of(context).pop();
    },
    shape: StadiumBorder(),
    color: Colors.green,
    textColor: Colors.white,
  );
}