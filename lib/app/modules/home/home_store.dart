import 'package:mobx/mobx.dart';
import 'package:todolist/app/modules/home/repository/todo_repository.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  
  final TodoRepository todoRepo;

  HomeStoreBase(this.todoRepo);
}