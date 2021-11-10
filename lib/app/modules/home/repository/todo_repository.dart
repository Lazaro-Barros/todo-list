import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/app/modules/home/models/todo_model.dart';

class TodoRepository{
  final FirebaseFirestore firestore;

  TodoRepository(this.firestore);

  List<Todo> getTodosFromQuery(QuerySnapshot snapshot) {
  return snapshot.docs.map((DocumentSnapshot doc) {
    return Todo.fromSnapshot(doc);
  }).toList();
}


  Stream<List<Todo>> getTodos(){
    return firestore.collection('todo').orderBy("date").snapshots().map((query){
      return query.docs.map((DocumentSnapshot doc) {
        return Todo.fromSnapshot(doc);
      }).toList();
    });
  }

  Future<void> addTodo(Todo todo) async {
    try{
      await firestore.collection('todo').add({"description":todo.description,"date":DateTime.now(), "done":false});
    }catch(e){

    }
  }

  Future<void> updateTodo(Todo todo) async {
    try{
      await todo.documentReference!.update({"description":todo.description,"date":todo.date, "done":todo.done});
    }catch(e){

    }
  }

  Future<void> deleteTodo(Todo todo) async {
    try{
      await todo.documentReference!.delete();
    }catch(e){

    }
  }
}