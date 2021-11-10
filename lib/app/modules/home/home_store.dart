import 'package:mobx/mobx.dart';
import 'package:todolist/app/modules/home/models/todo_model.dart';
import 'package:todolist/app/modules/home/repository/todo_repository.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final TodoRepository todoRepo;

  @observable
  ObservableStream<List<Todo>>? todoList;

  @observable
  bool isLoading = true;

  HomeStoreBase(this.todoRepo) {
    getTodoList();
  }

  @action
  getTodoList() {
    todoList = todoRepo.getTodos().asObservable();
    isLoading = false;
  }

  @action
  Future<void> addTodo(Todo todo) async {
    await todoRepo.addTodo(todo);
  }

  @action
  Future<void> updateTodo(Todo todo) async {
    await todoRepo.updateTodo(todo);
  }

   @action
  Future<void> deleteTodo(Todo todo) async {
    await todoRepo.deleteTodo(todo);
  }
}
