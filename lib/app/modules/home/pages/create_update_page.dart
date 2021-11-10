import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/modules/home/home_store.dart';
import 'package:todolist/app/modules/home/models/todo_model.dart';

class CreateUpdatePage extends StatefulWidget {
  const CreateUpdatePage({Key? key, this.todoId}) : super(key: key);
  final int? todoId;

  @override
  _CreateUpdatePageState createState() => _CreateUpdatePageState();
}

class _CreateUpdatePageState extends State<CreateUpdatePage> {
  final controller = Modular.get<HomeStore>();
  
  @override
  Widget build(BuildContext context) {
    List<Todo> list = controller.todoList!.data;
    Todo todo;
    if(widget.todoId!=null){
      todo= list[widget.todoId!];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Descrição TODO"),
            ),
            Text(controller.todoList!.name),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
    );
  }
}
