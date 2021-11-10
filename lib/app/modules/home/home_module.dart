import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/modules/home/pages/create_update_page.dart';
import 'package:todolist/app/modules/home/repository/todo_repository.dart';
import '../home/home_store.dart'; 

import 'pages/home_page.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
 Bind.lazySingleton((i) => HomeStore(i.get<TodoRepository>())),
 Bind.lazySingleton<TodoRepository>((i) => TodoRepository(FirebaseFirestore.instance)),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
   ChildRoute("/cadastro", child: (_, args) => CreateUpdatePage(todo: args.data,)),
 ];
}