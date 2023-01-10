import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_facebook_project/general/common_page.dart';
import 'package:self_facebook_project/modules/page/blocs/search_category_bloc.dart';
import 'package:self_facebook_project/modules/page/model/category_model.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(InitCategoryState()) {
    on<AddCategoryEvent>((event, emit) {
      CategoryModel addModel = state.model;
      addModel.listCate.add(event.category);
      emit(UpdateCategoryState(addModel));
      print(addModel.listCate.length);
    });
    on<DeleteCategoryEvent>((event, emit) {
      CategoryModel deleteModel = state.model;
      // for (int i = 0; i < deleteModel.listCate.length; i++) {
      //   if (deleteModel.listCate[i].contains( event.deleteValue)) {
      //     deleteModel.listCate.removeAt(i);
      //   }
      // }

      deleteModel.listCate.remove(event.deleteValue);
      emit(UpdateCategoryState(deleteModel));
      print(state.model.listCate.length);
    });
  }
}

abstract class CategoryEvent {}

class AddCategoryEvent extends CategoryEvent {
  final String category;
  AddCategoryEvent(this.category) : super();
}

class DeleteCategoryEvent extends CategoryEvent {
  final String deleteValue;
  DeleteCategoryEvent(this.deleteValue) : super();
}

abstract class CategoryState {
  final CategoryModel model;
  CategoryState(this.model);
}

class InitCategoryState extends CategoryState {
  InitCategoryState() : super(CategoryModel([]));
}

class UpdateCategoryState extends CategoryState {
  final CategoryModel _model;
  UpdateCategoryState(this._model) : super(_model);
}
