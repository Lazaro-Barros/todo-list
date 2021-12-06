import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/modules/home/home_store.dart';
import 'package:todolist/app/modules/home/models/todo_model.dart';

class TodoTile extends StatefulWidget {
  TodoTile({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends ModularState<TodoTile, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: ListTile(
        title: Text(
          widget.todo.description!,
          style: TextStyle(
              decoration: (widget.todo.done!)
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        leading: Checkbox(
          value: widget.todo.done,
          onChanged: (check) {
            widget.todo.done = check;
            widget.todo.update();
          },
        ),
        trailing: IconButton(
            onPressed: () {
              Modular.to.pushNamed("/cadastro", arguments: widget.todo);
            },
            icon: Icon(Icons.edit)),
      ),
    );
  }
}
