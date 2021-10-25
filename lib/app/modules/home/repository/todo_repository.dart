import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/app/modules/home/models/todo_model.dart';

class TodoRepository{
  final FirebaseFirestore firestore;

  TodoRepository(this.firestore);

  Stream<List<Todo>> getTodos(){
    return firestore.collection('todo').snapshots().map((query){
      return query.docs.map((doc){
        return Todo(documentReference: doc.reference,done: doc['done'],date: doc['date'],description: doc['description']);
      }).toList();
    });
  }
}