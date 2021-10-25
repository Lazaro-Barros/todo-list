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
    return firestore.collection('todo').snapshots().map((query){
      return query.docs.map((DocumentSnapshot doc) {
        print(doc['description']);
        return Todo.fromSnapshot(doc);
      }).toList();
    });
  }
}