import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:self_facebook_project/general/common_group.dart';
import 'package:self_facebook_project/modules/group/blocs/hide_group_bloc.dart';
import 'package:self_facebook_project/modules/group/blocs/select_private_rule_bloc.dart';
import 'package:self_facebook_project/modules/group/export_group_page.dart';
import 'package:self_facebook_project/modules/group/widgets/addtional_information_group_widget.dart';
import 'package:self_facebook_project/modules/group/widgets/information_user_group_widget.dart';
import 'package:self_facebook_project/modules/page/model/name_model.dart';

class RequestFriendsGroupPage extends StatefulWidget {
  @override
  State<RequestFriendsGroupPage> createState() =>
      _RequestFriendsGroupPageState();
}

class _RequestFriendsGroupPageState extends State<RequestFriendsGroupPage> {
  late double width = 0;
  late NamePageModel namePageModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: (() {
            FocusManager.instance.primaryFocus!.unfocus();
          }),
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(children: [
              Expanded(
                child: Container(
                  color: Colors.black87,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          RequestFriendsGroupCommon.TITLE_APPBAR,
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        )),
                        SizedBox(
                          height: 10,
                        ),

////////////////////////////////// public and private unhide group /////////////////////////////////////

                        BlocProvider.of<HideGroupBloc>(context)
                                    .state
                                    .selection !=
                                "Đã ẩn"
                            ? Column(
                                children: [
                                  // build share widget
                                  GestureDetector(
                                    onTap: (() {
                                      _showBottomSheetForShareComponent(
                                          context);
                                    }),
                                    child: InformationUserGroupWidget(
                                      [
                                        Text(
                                          "Chia sẻ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                      padding: EdgeInsets.zero,
                                      prefixWidget: Container(
                                        height: 40,
                                        width: 40,
                                        margin: EdgeInsets.only(right: 10),
                                        // padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            color: Colors.grey[800]),
                                        child: Icon(
                                          FontAwesomeIcons.share,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),

                                  // build email widget
                                  InformationUserGroupWidget([
                                    Text(
                                      RequestFriendsGroupCommon
                                          .EMAIL_REQUEST_TITLE,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(),
                                      child: Text(
                                          RequestFriendsGroupCommon
                                              .EMAIL_REQUEST_SUBTITLE,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13)),
                                    ),
                                  ],
                                      padding: EdgeInsets.zero,
                                      prefixWidget: Container(
                                        height: 40,
                                        width: 40,
                                        margin: EdgeInsets.only(right: 10),

                                        // padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            color: Colors.grey[800]),
                                        child: Icon(
                                          FontAwesomeIcons.envelope,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  //suggest example, include suggest, location, general group
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        _buildExampleComponent("Gợi ý"),
                                        _buildExampleComponent('Hà Nội',
                                            icon: FontAwesomeIcons.city),
                                        _buildExampleComponent('Nhóm chung',
                                            icon: FontAwesomeIcons.peopleGroup)
                                      ],
                                    ),
                                  ),
                                ],
                              )

////////////////////////////////// private and hide group /////////////////////////////////////
                            : Column(
                                children: [
                                  // build email widget
                                  InformationUserGroupWidget(
                                    [
                                      Text(
                                        RequestFriendsGroupCommon
                                            .EMAIL_REQUEST_TITLE,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: Text(
                                            RequestFriendsGroupCommon
                                                .EMAIL_REQUEST_SUBTITLE,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13)),
                                      ),
                                    ],
                                    prefixWidget: Icon(
                                      FontAwesomeIcons.envelope,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // request friend title 1
                                  Row(
                                    children: [
                                      Text(
                                        RequestFriendsGroupCommon
                                            .PRIVATE_TITLE[0],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // request friend subtitle
                                  Text(
                                      RequestFriendsGroupCommon
                                          .PRIVATE_SUB_TITLE[0],
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 21)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // request friend title 2
                                  Row(
                                    children: [
                                      Text(
                                        RequestFriendsGroupCommon
                                            .PRIVATE_TITLE[1],
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
                                  // request friend subtitle 2
                                  Text(
                                      RequestFriendsGroupCommon
                                          .PRIVATE_SUB_TITLE[1],
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  // share link
                                  AddtionalInformationGroupWidget(
                                    contentWidget: [
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: RequestFriendsGroupCommon
                                                .PRIVATE_LINK_EXAMPLE,
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ])),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: RequestFriendsGroupCommon
                                                .PRIVATE_DESCRIPTION_FOR_LINK_EXAMPLE,
                                            style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 13,
                                            )),
                                      ])),
                                    ],
                                    prefixWidget: GestureDetector(
                                      onTap: () {
                                        Clipboard.setData(ClipboardData(
                                            text: RequestFriendsGroupCommon
                                                .PRIVATE_LINK_EXAMPLE));
                                      },
                                      child: Container(
                                        height: 75,
                                        padding: EdgeInsets.only(
                                          right: 10,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.link,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),

/////////////////////////////////////////////////////  GENERAL ///////////////////////////////////////////////////
                        // search
                        Container(
                          height: 35,
                          child: TextFormField(
                            onChanged: ((value) {}),
                            textAlign: TextAlign.left,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesomeIcons.search,
                                  color: Colors.grey,
                                  size: 13,
                                ),
                                fillColor: Colors.grey[800],
                                filled: true,
                                contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                hintText: RequestFriendsGroupCommon
                                    .PLACEHOLDER_LIST[0],
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(17)))),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // build friend listview
                        Row(
                          children: [
                            Text(
                              RequestFriendsGroupCommon.PUBLIC_TITLE[3],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          height: BlocProvider.of<HideGroupBloc>(context)
                                      .state
                                      .selection !=
                                  "Đã ẩn"
                              ? 370
                              : 150,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return Container(
                                    // margin: EdgeInsets.symmetric(vertical: 5),
                                    child: InformationUserGroupWidget(
                                  [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          // color: Colors.red,
                                          width: 200,
                                          child: Text(
                                            "People ${index}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              // fixedSize: Size(200, 40),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  side: BorderSide())),
                                          onPressed: () {},
                                          child: Center(
                                            child: Text(
                                              "Mời",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                  prefixWidget: Container(
                                      height: 40,
                                      width: 40,
                                      margin: EdgeInsets.only(right: 10),

                                      // padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          color: Colors.grey[800]),
                                      child: Image.asset(
                                          RequestFriendsGroupCommon
                                              .IMG_PATH_LIST[index])),
                                  padding: EdgeInsets.zero,
                                ));
                              }),
                        )
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
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => CoverImageGroupPage()));
                      },
                      child: Text(CommonGroup.NEXT)),
                ),
              )
            ]),
          ),
        ));
  }
}

_showBottomSheetForShareComponent(BuildContext context) {
  showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return BlocBuilder<SelectionPrivateGroupBloc,
            SelectionPrivateGroupState>(builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 300,
            decoration: BoxDecoration(
                color: Colors.grey[900],
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
                margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
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
                          "Chia sẻ",
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
              Expanded(
                // height: 100,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                    itemCount: RequestFriendsGroupCommon
                        .SHARE_BOTTOM_SHEET_CONTENT_LIST.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          InformationUserGroupWidget(
                            [
                              Text(
                                RequestFriendsGroupCommon
                                    .SHARE_BOTTOM_SHEET_CONTENT_LIST[index][1],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                            prefixWidget: Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(right: 10),

                              // padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: Colors.grey[800]),
                              child: Icon(
                                RequestFriendsGroupCommon.SHARE_BOTTOM_SHEET_CONTENT_LIST[index][0],
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 5),
                            // changeBackground: Colors.transparent,
                          ),
                          Divider(color: Colors.white,height: 2,)
                        ],
                      );
                    })),
              )
            ]),
          );
        });
      });
}

// tạo ra thành phần gồm prefix, nội dung, suffix
Widget _buildExampleComponent(String title, {IconData? icon}) {
  return GestureDetector(
    onTap: (() {}),
    child: Flex(
      direction: Axis.horizontal,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
          height: 35,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.grey[800]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon != null
                  ? Row(
                      children: [
                        Container(
                          height: 18,
                          width: 18,
                          child: Center(
                              child: Icon(
                            icon,
                            size: 13,
                            color: Colors.white,
                          )),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Colors.grey[800]),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  : Container(),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
