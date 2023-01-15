import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_facebook_project/general/common_group.dart';
import 'package:self_facebook_project/general/common_page.dart';
import 'package:self_facebook_project/modules/group/blocs/select_target_group.dart';
import 'package:self_facebook_project/modules/group/export_group_page.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
import 'package:self_facebook_project/modules/page/blocs/name_bloc.dart';
import 'package:self_facebook_project/modules/page/model/name_model.dart';

class TargetGroupPage extends StatefulWidget {
  @override
  State<TargetGroupPage> createState() => _TargetGroupPageState();
}

class _TargetGroupPageState extends State<TargetGroupPage> {
  late double width = 0;
  late double height = 0;
  late NamePageModel namePageModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          Center(
              child: Container(
            child: Text(CommonGroup.CONTINUE_AFTER),
            margin: EdgeInsets.only(right: 20),
          ))
        ],
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {},
        // )
      ),
      body: BlocBuilder<NamePageBloc, NamePageState>(
          builder: (context, namePageState) {
        return GestureDetector(
          onTap: (() {
            FocusManager.instance.primaryFocus!.unfocus();
          }),
          child: Column(children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: Colors.black87,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          TargetGroupCommon.TITLE[0],
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
                    Text(TargetGroupCommon.SUBTITLE[0],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15)),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 366,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return BlocBuilder<SelectTargetGroupBloc,
                                    SelectTargetGroupState>(
                                builder: (context, state) {
                              return Container(
                                  // margin: EdgeInsets.symmetric(vertical: 5),
                                  child: _buildFlexibleComponent(
                                      context,
                                      Icon(TargetGroupCommon
                                          .ICON_DATA_LIST[index]),
                                      [TargetGroupCommon.CONTENT_LIST[index]],
                                      Checkbox(
                                          value: BlocProvider.of<
                                                      SelectTargetGroupBloc>(
                                                  context)
                                              .state
                                              .list[index],
                                          onChanged: (value) {
                                            List<
                                                bool> listSelected = BlocProvider
                                                    .of<SelectTargetGroupBloc>(
                                                        context)
                                                .state
                                                .list;
                                            listSelected[index] =
                                                !listSelected[index];
                                            context
                                                .read<SelectTargetGroupBloc>()
                                                .add(
                                                    UpdateSelectTargetGroupEvent(
                                                        listSelected));
                                            setState(() {});
                                          })));
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),

            /// bottom
            BlocBuilder<CurrentNumberPageCubit, int>(
                builder: (context, currentNumberPage) {
              return Container(
                height: 85,
                color: Colors.black87,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Divider(
                              height: 4,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Container(
                              height: 6,
                              width: width * 0.9,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: ((context, index) {
                                    return Container(
                                      margin: EdgeInsets.fromLTRB(
                                          index == 0 ? 0 : 5,
                                          0,
                                          index == 6 ? 0 : 5,
                                          0),
                                      width: (width * 0.9 - 4 * 7) / 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Colors.grey[800],
                                      ),
                                    );
                                  })),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Center(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: Size(width * 0.9, 40),
                                      backgroundColor: Colors.blue),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                CreatePostGroupPage()));
                                  },
                                  child: Text(CommonPage.NEXT)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ]),
              );
            }),
          ]),
        );
      }),
    );
  }
}

Widget _buildFlexibleComponent(BuildContext context, Widget prefixWidget,
    List<String> listContent, Widget suffixWidget) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(right: 15),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.grey[700]),
            child: prefixWidget,
          ),
        ),
        Flexible(
          flex: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 250,
                    margin: EdgeInsets.only(),
                    child: Text(listContent[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              suffixWidget,
            ],
          ),
        ),
      ],
    ),
  );
}
