import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_facebook_project/general/common_page.dart';

class SearchCategoryBloc
    extends Bloc<SearchCategoryEvent, SearchCategoryState> {
  SearchCategoryBloc() : super(InitSearchCategoryState()) {
    on<UpdateSearchCategoryEvent>((event, emit) {
      // List<String> searchValueList = Common.listSelection;
      // searchValueList.retainWhere((element) =>
      //     element.contains(event.searchString.toLowerCase()) ||
      //     element.contains(event.searchString.toUpperCase()));
      List<String> searchValueList = [];
      List<String> primaryList = CategoryPageCommon.listSelection;
      for (int i = 0; i < primaryList.length; i++) {
        if (primaryList[i].contains(event.searchString.toLowerCase()) ||
            primaryList[i].contains(event.searchString.toLowerCase())) {
          searchValueList.add(primaryList[i]);
        }
      }
      print(searchValueList.length);
      emit(UpdateSearchCategoryState(searchValueList));
    });
  }
}

abstract class SearchCategoryEvent {}

class UpdateSearchCategoryEvent extends SearchCategoryEvent {
  final String searchString;
  UpdateSearchCategoryEvent(this.searchString) : super();
}

abstract class SearchCategoryState {
  final List<String> searchList;
  SearchCategoryState(this.searchList);
}

class InitSearchCategoryState extends SearchCategoryState {
  InitSearchCategoryState() : super(CategoryPageCommon.listSelection);
}

class UpdateSearchCategoryState extends SearchCategoryState {
  final List<String> list;
  UpdateSearchCategoryState(this.list) : super(list);
}
