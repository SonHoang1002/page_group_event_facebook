import 'package:flutter_bloc/flutter_bloc.dart';

class SelectTargetGroupBloc
    extends Bloc<SelectTargetGroupEvent, SelectTargetGroupState> {
  SelectTargetGroupBloc() : super(InitSelectTargetGroupState()) {
    on<UpdateSelectTargetGroupEvent>((event, emit) {
      emit(UpdateSelectTargetGroupState(event.list));
      state.list.forEach((element) {
        print(element);
      });
    });
  }
}

abstract class SelectTargetGroupEvent {}

class UpdateSelectTargetGroupEvent extends SelectTargetGroupEvent {
  final List<bool> list;
  UpdateSelectTargetGroupEvent(this.list) : super();
}

abstract class SelectTargetGroupState {
  final List<bool> list;
  SelectTargetGroupState(this.list);
}

class InitSelectTargetGroupState extends SelectTargetGroupState {
  InitSelectTargetGroupState()
      : super([
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
        ]);
}

class UpdateSelectTargetGroupState extends SelectTargetGroupState {
  final List<bool> list;
  UpdateSelectTargetGroupState(this.list) : super(list);
}
