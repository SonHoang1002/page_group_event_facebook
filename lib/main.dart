import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_facebook_project/modules/event/blocs/selection_private_event_bloc.dart';
import 'package:self_facebook_project/modules/event/export_event_page.dart';
import 'package:self_facebook_project/modules/event/screen/location_event_page.dart';
import 'package:self_facebook_project/modules/group/blocs/hide_group_bloc.dart';
import 'package:self_facebook_project/modules/group/blocs/select_private_rule_bloc.dart';
import 'package:self_facebook_project/modules/group/blocs/select_target_group.dart';
import 'package:self_facebook_project/modules/group/export_group_page.dart';
import 'package:self_facebook_project/modules/page/blocs/category_bloc.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
import 'package:self_facebook_project/modules/page/blocs/name_bloc.dart';
import 'package:self_facebook_project/modules/page/blocs/search_category_bloc.dart';
import 'package:self_facebook_project/modules/page/blocs/select_province_page_bloc.dart';
import 'package:self_facebook_project/modules/page/export_page.dart';
import 'package:self_facebook_project/observer_blocs.dart';
import 'package:self_facebook_project/test_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NamePageBloc>(create: ((context) => NamePageBloc())),
          BlocProvider<SearchCategoryBloc>(
              create: ((context) => SearchCategoryBloc())),
          BlocProvider<CurrentNumberPageCubit>(
              create: ((context) => CurrentNumberPageCubit())),
          BlocProvider<CategoryBloc>(create: ((context) => CategoryBloc())),
          BlocProvider<SelectionPrivateEventBloc>(
              create: ((context) => SelectionPrivateEventBloc())),
          BlocProvider<SelectionPrivateGroupBloc>(
              create: ((context) => SelectionPrivateGroupBloc())),
          BlocProvider<HideGroupBloc>(create: ((context) => HideGroupBloc())),
          BlocProvider<SelectTargetGroupBloc>(
              create: ((context) => SelectTargetGroupBloc())),
          BlocProvider<SelectProvinceBloc>(
              create: ((context) => SelectProvinceBloc())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.blue, backgroundColor: Colors.black87),
          // test
          // home: TestWidget(),

          // begin group
          // home: CreateGroupPage(),

          // begin event
          home: CreateEventPage(),

          // begin page
          // home: PrimaryPage(),

          // part
          // home:RequestFriendsGroupPage()
        ));
  }
}
