import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/modules/home/models/todo_model.dart';
import '../components/todo_tile_widget.dart';
import '../home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          if (controller.todoList!.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.todoList!.hasError) {
            print("Ocorreu um erro: " + controller.todoList!.error.toString());
            return Center(
                child: Text("Ocorreu um erro ao tentar listar as atividades"));
          } else {
            List<Todo> list = controller.todoList!.data;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) {
                  return TodoTile(todo: list[index]);
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Modular.to.pushNamed("/cadastro");
          },
          child: Icon(Icons.add)),
    );
  }
}
