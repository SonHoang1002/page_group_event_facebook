import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionPrivateEventBloc
    extends Bloc<SelectionPrivateEventEvent, SelectionPrivateEventState> {
  SelectionPrivateEventBloc() : super(InitSelectionPrivateEventState()) {
    on<UpdateSelectionPrivateEventEvent>((event, emit) {
      emit(UpdateSelectionPrivateEventState(event.selection));
      print("state.selection: ${state.selection}");
    });
  }
}

abstract class SelectionPrivateEventEvent {}

class UpdateSelectionPrivateEventEvent extends SelectionPrivateEventEvent {
  final String selection;
  UpdateSelectionPrivateEventEvent(this.selection) : super();
}

abstract class SelectionPrivateEventState {
  final String selection;
  SelectionPrivateEventState(this.selection);
}

class InitSelectionPrivateEventState extends SelectionPrivateEventState {
  InitSelectionPrivateEventState() : super("");
}

class UpdateSelectionPrivateEventState extends SelectionPrivateEventState {
  final String _selection;
  UpdateSelectionPrivateEventState(this._selection) : super(_selection);
}
