import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionPrivateGroupBloc
    extends Bloc<SelectionPrivateGroupEvent, SelectionPrivateGroupState> {
  SelectionPrivateGroupBloc() : super(InitSelectionPrivateGroupState()) {
    on<UpdateSelectionPrivateGroupEvent>((event, emit) {
      emit(UpdateSelectionPrivateGroupState(event.selection));
      print(state.selection);
    });
  }
}

abstract class SelectionPrivateGroupEvent {}

class UpdateSelectionPrivateGroupEvent extends SelectionPrivateGroupEvent {
  final String selection;
  UpdateSelectionPrivateGroupEvent(this.selection) : super();
}

abstract class SelectionPrivateGroupState {
  final String selection;
  SelectionPrivateGroupState(this.selection);
}

class InitSelectionPrivateGroupState extends SelectionPrivateGroupState {
  InitSelectionPrivateGroupState() : super("");
}

class UpdateSelectionPrivateGroupState extends SelectionPrivateGroupState {
  final String _selection;
  UpdateSelectionPrivateGroupState(this._selection) : super(_selection);
}
