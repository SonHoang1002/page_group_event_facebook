import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_facebook_project/modules/page/blocs/category_bloc.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
import 'package:self_facebook_project/modules/page/blocs/name_bloc.dart';
import 'package:self_facebook_project/modules/page/blocs/search_category_bloc.dart';
import 'package:self_facebook_project/modules/page/register/parts/information_page.dart';
import 'package:self_facebook_project/modules/page/register/parts/name_page.dart';
import 'package:self_facebook_project/modules/page/register/primary_page.dart';
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
          BlocProvider<NamePageCubit>(create: ((context) => NamePageCubit())),
          BlocProvider<SearchCategoryBloc>(
              create: ((context) => SearchCategoryBloc())),
          BlocProvider<CurrentNumberPageCubit>(
              create: ((context) => CurrentNumberPageCubit())),
          BlocProvider<CategoryBloc>(create: ((context) => CategoryBloc())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor: Colors.black87
          ),
          // home: TestWidget(),
          // home: NamePage(),
          home:InformationPage()

        ));
  }
}
