import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/modules/home/home_store.dart';
import 'package:todolist/app/modules/home/models/todo_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateUpdatePage extends StatefulWidget {
  const CreateUpdatePage({Key? key, this.todo}) : super(key: key);
  final Todo? todo;

  @override
  _CreateUpdatePageState createState() => _CreateUpdatePageState();
}

class _CreateUpdatePageState extends ModularState<CreateUpdatePage, HomeStore> {
  var descriptionControlles = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (widget.todo != null) {
      descriptionControlles.text = widget.todo!.description!;
    }
    return Scaffold(
      appBar: AppBar(
        title: widget.todo == null
            ? Text("Cadastro de TODO")
            : Text("Edição de TODO"),
        actions: widget.todo != null ? [IconButton(onPressed: () async {
          await controller.deleteTodo(widget.todo!);
           Navigator.pop(context);
        }, icon: Icon(Icons.delete),)] : [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: descriptionControlles,
              decoration: InputDecoration(labelText: "Descrição TODO"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (widget.todo == null) {
              await controller
                  .addTodo(Todo(description: descriptionControlles.text));
            } else {
              widget.todo!.description = descriptionControlles.text;
              await controller.updateTodo(widget.todo!);
            }

            Navigator.pop(context);
          },
          child: Icon(Icons.save_rounded)),
    );
  }
}
