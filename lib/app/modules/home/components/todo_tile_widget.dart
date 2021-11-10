import 'package:flutter/material.dart';
import 'package:todolist/app/modules/home/models/todo_model.dart';

class TodoTile extends StatefulWidget {
  TodoTile({ Key? key, required this.todo }) : super(key: key);
  Todo todo;

  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: ListTile(
        title: Text(widget.todo.description!),
        leading: Checkbox(value: widget.todo.done,onChanged: (check){
          widget.todo.done=check;
          widget.todo.update();
        },),
      ),
    );
  }
}