import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_facebook_project/general/common_page.dart';

class SelectProvinceBloc
    extends Bloc<SelectProvinceEvent, SelectProvinceState> {
  SelectProvinceBloc() : super(InitSelectProvinceState()) {
    on<UpdateSelectProvinceEvent>((event, emit) {
      List<String> selectValueList = [];
      List<String> primaryList = InformationPageCommon.PROVINCE_LIST;
      for (int i = 0; i < primaryList.length; i++) {
        if (primaryList[i].contains(event.selectString.toLowerCase()) ||
            primaryList[i].contains(event.selectString.toUpperCase())) {
          selectValueList.add(primaryList[i]);
        }
      }
      emit(UpdateSelectProvinceState(selectValueList));
    });
  }
}

abstract class SelectProvinceEvent {}

class UpdateSelectProvinceEvent extends SelectProvinceEvent {
  final String selectString;
  UpdateSelectProvinceEvent(this.selectString) : super();
}

abstract class SelectProvinceState {
  final List<String> selectList;
  SelectProvinceState(this.selectList);
}

class InitSelectProvinceState extends SelectProvinceState {
  InitSelectProvinceState() : super(InformationPageCommon.PROVINCE_LIST);
}

class UpdateSelectProvinceState extends SelectProvinceState {
  final List<String> list;
  UpdateSelectProvinceState(this.list) : super(list);
}
