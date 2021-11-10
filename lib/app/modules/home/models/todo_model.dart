import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String? description;
  bool? done;
  Timestamp? date;
  DocumentReference? documentReference;

  

  factory Todo.fromSnapshot(DocumentSnapshot doc){
    return Todo(documentReference: doc.reference,done: doc['done'],date: doc['date'],description: doc['description']);
  }

  Todo({this.documentReference, this.description,this.done,this.date});

  update(){
    if (documentReference != null){
      documentReference!.update({
        'description': description,
        'done': done,
        'date': date,
      }
      );
    }
  
  }
  
  create(){


  }
}