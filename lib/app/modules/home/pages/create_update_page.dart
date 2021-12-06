import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/modules/home/home_store.dart';
import 'package:todolist/app/modules/home/models/todo_model.dart';

class CreateUpdatePage extends StatefulWidget {
  const CreateUpdatePage({Key? key, this.todo}) : super(key: key);
  final Todo? todo;

  @override
  _CreateUpdatePageState createState() => _CreateUpdatePageState();
}

class _CreateUpdatePageState extends ModularState<CreateUpdatePage, HomeStore> {
  var descriptionController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (widget.todo != null) {
      descriptionController.text = widget.todo!.description!;
    }
    return Scaffold(
      appBar: AppBar(
        title: widget.todo == null
            ? Text("Cadastro de TODO")
            : Text("Edição de TODO"),
        actions: widget.todo != null
            ? [
                IconButton(
                  onPressed: () async {
                    await controller.deleteTodo(widget.todo!);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.delete),
                )
              ]
            : [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Descrição TODO"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (widget.todo == null) {
              await controller
                  .addTodo(Todo(description: descriptionController.text));
            } else {
              widget.todo!.description = descriptionController.text;
              await controller.updateTodo(widget.todo!);
            }

            Navigator.pop(context);
          },
          child: Icon(Icons.save_rounded)),
    );
  }
}
