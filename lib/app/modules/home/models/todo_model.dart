import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String? description;
  bool? done;
  DateTime? date;
  final DocumentReference documentReference;


  Todo({required this.documentReference, this.description,this.done,this.date});
}