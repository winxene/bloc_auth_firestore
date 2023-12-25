part of 'firestore_bloc.dart';

abstract class CreateEvent {}

class CreateDocumentEvent extends CreateEvent {
  final String name;
  final String author;
  final Map<String, double> score;

  CreateDocumentEvent(this.name, this.author, this.score);
}
