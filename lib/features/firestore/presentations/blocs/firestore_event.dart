part of 'firestore_bloc.dart';

abstract class CreateEvent {}

class CreateDocumentEvent extends CreateEvent {
  final String name;
  final String author;
  final Map<String, double> score;

  CreateDocumentEvent(this.name, this.author, this.score);
}

class UpdateDocumentEvent extends CreateEvent {
  final String id;
  final String name;
  final String author;
  final Map<String, double> score;

  UpdateDocumentEvent(this.id, this.name, this.author, this.score);
}
