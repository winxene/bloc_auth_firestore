part of 'firestore_create_bloc.dart';

// states.dart
abstract class CreateState {}

class CreateInitial extends CreateState {}

class CreateLoading extends CreateState {}

class CreateSuccess extends CreateState {}

class CreateFailure extends CreateState {
  final String error;

  CreateFailure(this.error);
}
