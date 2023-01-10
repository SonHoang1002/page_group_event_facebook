import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_facebook_project/general/common_page.dart';
import 'package:self_facebook_project/general/format_input.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
import 'package:self_facebook_project/modules/page/blocs/name_bloc.dart';
import 'package:self_facebook_project/modules/page/model/name_model.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late double width = 0;
  late NamePageModel namePageModel;
  List<bool> listSwitch = [false, false];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          //
          context.read<CurrentNumberPageCubit>().updateCurrentNumberPageCubit(
              context.read<CurrentNumberPageCubit>().state - 1);
          Navigator.of(context).pop();
        },
      )),
      body: BlocBuilder<NamePageBloc, NamePageState>(
          builder: (context, namePageState) {
        namePageModel =
            BlocProvider.of<NamePageBloc>(context).state.namePageModel;
        return GestureDetector(
          onTap: (() {
            FocusManager.instance.primaryFocus!.unfocus();
          }),
          child: Column(children: [
            Expanded(
              child: Container(
                color: Colors.black87,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            Settings.TITLE_SETTINGS[0],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(Settings.TITLE_SETTINGS[1],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 17)),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: Settings.COUNTER_CONTENT.map((index) {
                          return Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(children: [
                              Flexible(
                                flex: 8,
                                child: Column(children: [
                                  Text(
                                    Settings.TITLE_CONTENT[index],
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(Settings.SUBTITLE_CONTENT[index],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ]),
                              ),
                              Flexible(
                                  flex: 2,
                                  child: Switch(
                                    value: listSwitch[index],
                                    onChanged: ((value) {
                                      setState(() {
                                        listSwitch[index] = !listSwitch[index];
                                      });
                                    }),
                                  )),
                            ]),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
            ),

            /// bottom
            BlocBuilder<CurrentNumberPageCubit, int>(
                builder: (context, currentNumberPage) {
              return Container(
                height: 70,
                color: Colors.black87,
                child: Column(children: [
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(width * 0.9, 40),
                            backgroundColor:
                                namePageModel.nameController.text.trim() == ""
                                    ? Colors.grey[800]
                                    : Colors.blue),
                        onPressed: () {
                          // context
                          //     .read<CurrentNumberPageCubit>()
                          //     .updateCurrentNumberPageCubit(
                          //         currentNumberPage + 1);
                        },
                        child: Text(CommonPage.DONE)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: Container(
                    height: 6,
                    width: width * 0.9,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: ((context, index) {
                          return Container(
                            margin: EdgeInsets.fromLTRB(
                                index == 0 ? 0 : 5, 0, index == 6 ? 0 : 5, 0),
                            width: width * 0.10555,
                            // height: 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: index <= currentNumberPage - 1
                                  ? Colors.blue
                                  : Colors.grey[800],
                            ),
                          );
                        })),
                  ))
                ]),
              );
            }),
          ]),
        );
      }),
    );
  }
}
