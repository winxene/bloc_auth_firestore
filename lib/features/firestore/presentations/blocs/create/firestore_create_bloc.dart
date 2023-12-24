import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/create_usecase.dart';
import '../../../data/models/data_model.dart';

part 'firestore_create_event.dart';
part 'firestore_create_state.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  final CreateUseCase _createUseCase;

  CreateBloc(this._createUseCase) : super(CreateInitial()) {
    on<CreateDocumentEvent>((event, emit) async {
      emit(CreateLoading());
      try {
        DataModel dataModel = DataModel(
          name: event.name,
          author: event.author,
          score: event.score,
        );
        await _createUseCase.execute(dataModel, 'books');
        emit(CreateSuccess());
      } catch (e) {
        emit(CreateFailure(e.toString()));
      }
    });
  }
}
