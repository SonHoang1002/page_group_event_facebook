import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_facebook_project/modules/page/model/name_model.dart';

class NamePageCubit extends Cubit<NamePageModel> {
  NamePageCubit() : super(NamePageModel(TextEditingController(text: "")));
  void updateNamePageCubit(NamePageModel namePageModel) {
    emit(namePageModel);
    print("call cubit");
    print(namePageModel.nameController.text);
  }
}

class NamePageBloc extends Bloc<NamePageEvent, NamePageState> {
  NamePageBloc() : super(InitNamePageState()) {
    on<UpdateNamePageEvent>((event, emit) {
      emit(UpdateNamePageState(event._namePageModel));
      print("call UpdateNamePageEvent");
    });
  }
}

abstract class NamePageState {
  final NamePageModel namePageModel;
  NamePageState(this.namePageModel);
}

class InitNamePageState extends NamePageState {
  InitNamePageState() : super(NamePageModel(TextEditingController(text: "")));
}

class UpdateNamePageState extends NamePageState {
  final NamePageModel _namePageModel;
  UpdateNamePageState(this._namePageModel) : super(_namePageModel);
}

abstract class NamePageEvent {}

class UpdateNamePageEvent extends NamePageEvent {
  final NamePageModel _namePageModel;
  UpdateNamePageEvent(this._namePageModel);
}
