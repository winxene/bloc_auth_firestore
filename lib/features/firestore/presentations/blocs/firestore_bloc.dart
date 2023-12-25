import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/create_usecase.dart';
import '../../data/models/data_model.dart';

part 'firestore_event.dart';
part 'firestore_state.dart';

class FirestoreBloc extends Bloc<CreateEvent, CreateState> {
  final CreateUseCase _createUseCase;

  FirestoreBloc(this._createUseCase) : super(CreateInitial()) {
    on<CreateDocumentEvent>((event, emit) async {
      emit(CreateLoading());
      try {
        DataModel dataModel = DataModel(
          name: event.name,
          author: event.author,
          score: event.score,
          id: uuid(),
        );
        await _createUseCase.createDocument(dataModel, 'books');
        emit(CreateSuccess());
      } catch (e) {
        emit(CreateFailure(e.toString()));
      }
    });
  }

  String uuid() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}