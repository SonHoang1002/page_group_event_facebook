import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:self_facebook_project/general/common_group.dart';
import 'package:self_facebook_project/modules/group/blocs/hide_group_bloc.dart';
import 'package:self_facebook_project/modules/group/blocs/select_private_rule_bloc.dart';
import 'package:self_facebook_project/modules/group/export_group_page.dart';

import 'package:self_facebook_project/modules/group/widgets/addtional_information_group_widget.dart';
import 'package:self_facebook_project/modules/group/widgets/format_input_widget.dart';

class CreateGroupPage extends StatefulWidget {
  @override
  State<CreateGroupPage> createState() => CreateGroupPageState();
}

class CreateGroupPageState extends State<CreateGroupPage> {
  late double width = 0;
  late String selectPrivateRule = "";
  late TextEditingController _nameController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: Center(child: Text(CreateGroupCommon.TITLE_APPBAR)),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                // Navigator.of(context).pop();
              },
            )),
        body: GestureDetector(
          onTap: (() {
            FocusManager.instance.primaryFocus!.unfocus();
          }),
          child: Column(children: [
            Expanded(
              child: Container(
                color: Colors.black87,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    children: [
                      // name title
                      Row(
                        children: [
                          Text(
                            CreateGroupCommon.TITLE_LIST[0],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // space
                      const SizedBox(
                        height: 10,
                      ),
                      // name input
                      Container(
                        height: 80,
                        child: TextFormField(
                          controller: _nameController,
                          onChanged: ((value) {}),
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              hintText: CreateGroupCommon.PLACEHOLDER_LIST[0],
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                      ),
                      // divider
                      Divider(
                        height: 3,
                        color: Colors.grey[800],
                      ),
                      //space
                      const SizedBox(
                        height: 10,
                      ),
                      // private title
                      Row(
                        children: [
                          Text(
                            CreateGroupCommon.TITLE_LIST[1],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // space
                      const SizedBox(
                        height: 10,
                      ),
                      // private input
                      BlocProvider.of<SelectionPrivateGroupBloc>(context)
                                  .state
                                  .selection !=
                              ""
                          ? buildFillInput(
                              context,
                              BlocProvider.of<SelectionPrivateGroupBloc>(
                                              context)
                                          .state
                                          .selection ==
                                      "Công khai"
                                  ? FontAwesomeIcons.earthAmericas
                                  : FontAwesomeIcons.lock,
                              CreateGroupCommon.TITLE_LIST[1],
                              BlocProvider.of<SelectionPrivateGroupBloc>(
                                      context)
                                  .state
                                  .selection)
                          : buildEmptyInput(
                              context,
                            ),
                      // space
                      const SizedBox(
                        height: 10,
                      ),
                      BlocProvider.of<SelectionPrivateGroupBloc>(context)
                                  .state
                                  .selection ==
                              "Công khai"
                          ? Container(
                              child: AddtionalInformationGroupWidget(
                                  contentWidget: [
                                  Text(
                                    CreateGroupCommon.DEFEND_PUBLIC_RULE[0],
                                    style: TextStyle(
                                        color: Colors.grey[400], fontSize: 16),
                                  ),
                                ]))
                          : Container(),
                      BlocProvider.of<SelectionPrivateGroupBloc>(context)
                                  .state
                                  .selection ==
                              "Riêng tư"
                          // hide group component
                          ? Column(
                              children: [
                                // additinal description for private rule
                                AddtionalInformationGroupWidget(contentWidget: [
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: CreateGroupCommon
                                            .DEFEND_PRIVATE_RULE[0],
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 16,
                                        )),
                                    TextSpan(
                                        text: CreateGroupCommon
                                            .DEFEND_PRIVATE_RULE[1],
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ])),
                                ]),
                                //space
                                SizedBox(
                                  height: 20,
                                ),

                                //divider
                                Divider(
                                  height: 3,
                                  color: Colors.white,
                                ),
                                // space
                                SizedBox(
                                  height: 10,
                                ),
                                // hide group title
                                Row(
                                  children: [
                                    Text(
                                      CreateGroupCommon.TITLE_LIST[2],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                // space
                                SizedBox(
                                  height: 10,
                                ),
                                // hide group input
                                buildFillInput(
                                    context,
                                    BlocProvider.of<HideGroupBloc>(context)
                                                .state
                                                .selection ==
                                            "Hiển thị"
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    CreateGroupCommon.TITLE_LIST[2],
                                    BlocProvider.of<HideGroupBloc>(context)
                                        .state
                                        .selection),
                              ],
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
            ),

            /// bottom
            Container(
              height: 70,
              color: Colors.black87,
              child: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(width * 0.9, 40),
                        backgroundColor:
                            BlocProvider.of<SelectionPrivateGroupBloc>(context)
                                            .state
                                            .selection !=
                                        "" &&
                                    _nameController.text.trim() != ""
                                ? Colors.blue
                                : Colors.grey[800]),
                    onPressed: () {
                      if (BlocProvider.of<SelectionPrivateGroupBloc>(context)
                              .state
                              .selection ==
                          "Công khai") {
                        BlocProvider.of<HideGroupBloc>(context)
                            .add(UpdateHideGroupEvent("Hiển thị"));
                      }

                      if (BlocProvider.of<SelectionPrivateGroupBloc>(context)
                                  .state
                                  .selection !=
                              "" &&
                          _nameController.text.trim() != "") {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => RequestFriendsGroupPage()));
                      }
                    },
                    child: Text(CommonGroup.CREATE_GROUP)),
              ),
            )
          ]),
        ));
  }

  Widget buildEmptyInput(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        bottomSheetPrivateRule(context);
      }),
      child: Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(color: Colors.white)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(CreateGroupCommon.PLACEHOLDER_LIST[1],
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                ],
              ),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.caretDown,
                    color: Colors.grey[800],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Widget buildSelectionInput(
      BuildContext context,
      IconData iconData,
      String title,
      String content,
      String groupValueForRadio,
      String valueForRadio) {
    return GestureDetector(
      onTap: (() {
        //
      }),
      child: StatefulBuilder(builder: (context, setStateFull) {
        return Container(
          // height: 60,
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(right: 5),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.grey[700]),
                  child: Icon(
                    iconData,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
              Flexible(
                flex: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Text(content,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13)),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Radio(
                          value: valueForRadio,
                          groupValue: groupValueForRadio,
                          onChanged: (value) {
                            if (title == "Công khai" || title == "Riêng tư") {
                              BlocProvider.of<SelectionPrivateGroupBloc>(
                                      context)
                                  .add(UpdateSelectionPrivateGroupEvent(
                                      value as String));
                              setStateFull(
                                () {},
                              );
                              setState(() {});
                              ;

                              return;
                            }
                            BlocProvider.of<HideGroupBloc>(context)
                                .add(UpdateHideGroupEvent(value as String));
                            setStateFull(
                              () {},
                            );
                            setState(() {});
                            ;
                            return;
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildFillInput(
      BuildContext context, IconData iconData, String title, String content) {
    return GestureDetector(
      onTap: (() {
        if (title == CreateGroupCommon.TITLE_LIST[1]) {
          bottomSheetPrivateRule(context);
        } else if (title == CreateGroupCommon.TITLE_LIST[2]) {
          bottomSheetHideGroup(context);
        }
      }),
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(color: Colors.white)),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 40,
                width: 40,
                // padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.grey[800]),
                child: Icon(
                  iconData,
                  color: Colors.white,
                  size: 14,
                ),
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
                        margin: EdgeInsets.only(top: 5),
                        child: Text(title,
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(content,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.caretDown,
                        color: Colors.grey[800],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bottomSheetPrivateRule(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return BlocBuilder<SelectionPrivateGroupBloc,
              SelectionPrivateGroupState>(builder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 220,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15))),
              child: Column(children: [
                // drag and drop navbar
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Container(
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15))),
                  ),
                ),
                // title
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: Row(
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: (() {
                            Navigator.of(context).pop();
                            FocusManager.instance.primaryFocus!.unfocus();
                          }),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                        flex: 2,
                      ),
                      Flexible(
                        flex: 10,
                        child: Container(
                            child: Center(
                          child: Text(
                            "Chọn quyền riêng tư",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                // divider
                Divider(
                  height: 4,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),

                buildSelectionInput(
                  context,
                  FontAwesomeIcons.earthAmericas,
                  "Công khai",
                  "Bất kỳ ai cũng có thể nhìn thấy mọi người trong nhóm và những gì họ đăng.",
                  BlocProvider.of<SelectionPrivateGroupBloc>(context)
                      .state
                      .selection,
                  "Công khai",
                ),
                buildSelectionInput(
                  context,
                  FontAwesomeIcons.lock,
                  "Riêng tư",
                  "Chỉ thành viên mới nhìn thấy mọi người trong nhóm và những gì họ đăng.",
                  BlocProvider.of<SelectionPrivateGroupBloc>(context)
                      .state
                      .selection,
                  "Riêng tư",
                )
              ]),
            );
          });
        });
  }

  bottomSheetHideGroup(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return BlocBuilder<HideGroupBloc, HideGroupState>(
              builder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 220,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15))),
              child: Column(children: [
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Container(
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: Row(
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: (() {
                            Navigator.of(context).pop();
                            FocusManager.instance.primaryFocus!.unfocus();
                          }),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                        flex: 2,
                      ),
                      Flexible(
                        flex: 10,
                        child: Container(
                            child: Center(
                          child: Text(
                            "Ẩn nhóm",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 4,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                buildSelectionInput(
                  context,
                  FontAwesomeIcons.eye,
                  "Hiển thị",
                  "Ai cũng có thể nhìn thấy nhóm này",
                  BlocProvider.of<HideGroupBloc>(context).state.selection,
                  "Hiển thị",
                ),
                buildSelectionInput(
                  context,
                  FontAwesomeIcons.eyeSlash,
                  "Đã ẩn",
                  "Chỉ thành viên mới nhìn tháy nhóm này",
                  BlocProvider.of<HideGroupBloc>(context).state.selection,
                  "Đã ẩn",
                )
              ]),
            );
          });
        });
  }
}
