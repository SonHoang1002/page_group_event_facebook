
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:self_facebook_project/general/group_constants.dart';
import 'package:self_facebook_project/modules/group/blocs/hide_group_bloc.dart';
import 'package:self_facebook_project/modules/group/blocs/select_private_rule_bloc.dart';
import 'package:self_facebook_project/modules/group/export_group_page.dart';
import 'package:self_facebook_project/modules/group/widgets/additional_information_for_selection_of_request_friend.dart';
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
  late double height = 0;
  late NamePageModel namePageModel;
  late bool isSuggestSelection = true;
  late bool isLocationSelection = false;
  late bool isGeneralGroupSelection = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    width = size.width;
    height = size.height;

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
                          RequestFriendsGroupConstants.TITLE_APPBAR,
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        )),
                        SizedBox(
                          height: 10,
                        ),

////////////////////////////////// public and private unhide group /////////////////////////////////////

                        BlocProvider.of<HideGroupBloc>(context)
                                    .state
                                    .selection !=
                                "???? ???n"
                            ? Column(
                                children: [
                                  // build share widget
                                  InformationUserGroupWidget(
                                    [
                                      Text(
                                        "Chia s???",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                    padding: EdgeInsets.zero,
                                    prefixWidget: GestureDetector(
                                      onTap: (() {
                                        _showBottomSheetForShareComponent(
                                            context);
                                      }),
                                      child: Container(
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
                                      RequestFriendsGroupConstants
                                          .EMAIL_REQUEST_TITLE,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(),
                                      child: Text(
                                          RequestFriendsGroupConstants
                                              .EMAIL_REQUEST_SUBTITLE,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13)),
                                    ),
                                  ],
                                      padding: EdgeInsets.zero,
                                      prefixWidget: GestureDetector(
                                        onTap: () {
                                          _showBottomSheetForRequestFriendByEmail(
                                              context, height);
                                        },
                                        child: Container(
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
                                        GestureDetector(
                                          onTap: (() {
                                            setState(() {
                                              isSuggestSelection = true;
                                              isGeneralGroupSelection = false;
                                              isLocationSelection = false;
                                            });
                                          }),
                                          child: _buildExampleComponent(
                                              "G???i ??", isSuggestSelection),
                                        ),
                                        GestureDetector(
                                          onTap: (() {
                                            setState(() {
                                              isSuggestSelection = false;
                                              isGeneralGroupSelection = false;
                                              isLocationSelection = true;
                                            });
                                          }),
                                          child: _buildExampleComponent(
                                              'H?? N???i', isLocationSelection,
                                              icon: FontAwesomeIcons.city),
                                        ),
                                        GestureDetector(
                                          onTap: (() {
                                            setState(() {
                                              isSuggestSelection = false;
                                              isGeneralGroupSelection = true;
                                              isLocationSelection = false;
                                            });
                                          }),
                                          child: _buildExampleComponent(
                                              'Nh??m chung',
                                              isGeneralGroupSelection,
                                              icon:
                                                  FontAwesomeIcons.peopleGroup),
                                        )
                                      ],
                                    ),
                                  ),
                                  isLocationSelection
                                      ? AdditionalInformationForSelectionOfRequestFriendWidget(
                                          title: "H?? N???i",
                                          subTile:
                                              "B???n b?? s???ng c??ng t???nh/ th??nh ph??? v???i b???n")
                                      : Container(),
                                  isGeneralGroupSelection
                                      ? Column(
                                          children: [
                                            AdditionalInformationForSelectionOfRequestFriendWidget(
                                                title: "Nh??m chung",
                                                subTile:
                                                    "L???c theo b???n b?? ??? chung nh??m v???i b???n"),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: ElevatedButton(
                                                  onPressed: (() {
                                                    _showBottomSheetSelectionGroupForRequestFriend(
                                                        context, width);
                                                  }),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text("???? ch???n 0 nh??m"),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 5),
                                                          child: Icon(
                                                              FontAwesomeIcons
                                                                  .caretDown,
                                                              size: 14,
                                                              color: Colors
                                                                  .white)),
                                                    ],
                                                  )),
                                            )
                                          ],
                                        )
                                      : Container()
                                ],
                              )

////////////////////////////////// private and hide group /////////////////////////////////////
                            : Column(
                                children: [
                                  // build email widget
                                  InformationUserGroupWidget(
                                    [
                                      Text(
                                        RequestFriendsGroupConstants
                                            .EMAIL_REQUEST_TITLE,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: Text(
                                            RequestFriendsGroupConstants
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
                                        RequestFriendsGroupConstants
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
                                      RequestFriendsGroupConstants
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
                                        RequestFriendsGroupConstants
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
                                      RequestFriendsGroupConstants
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
                                            text: RequestFriendsGroupConstants
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
                                            text: RequestFriendsGroupConstants
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
                                            text: RequestFriendsGroupConstants
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
                                hintText: RequestFriendsGroupConstants
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
                              RequestFriendsGroupConstants.PUBLIC_TITLE[3],
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
                        // friend listView
                        Container(
                          height: BlocProvider.of<HideGroupBloc>(context)
                                      .state
                                      .selection !=
                                  "???? ???n"
                              ? isGeneralGroupSelection
                                  ? 250
                                  : 355
                              : 150,
                          child: isGeneralGroupSelection
                              ? Container(
                                  child: Column(children: [
                                    Container(
                                      height: 100,
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Image.asset(
                                          GroupConstants.PATH_IMG + "cat_1.png",
                                          fit: BoxFit.fitWidth),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        "Kh??ng t??m th???y k???t qu??? n??o",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "Th??? t??m t??n kh??c",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ]),
                                )
                              : ListView.builder(
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  // fixedSize: Size(200, 40),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      side: BorderSide())),
                                              onPressed: () {},
                                              child: Center(
                                                child: Text(
                                                  "M???i",
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
                                              RequestFriendsGroupConstants
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
                      child: Text(GroupConstants.NEXT)),
                ),
              )
            ]),
          ),
        ));
  }
}

_showBottomSheetForShareComponent(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return BlocBuilder<SelectionPrivateGroupBloc,
            SelectionPrivateGroupState>(builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 230,
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
                          "Chia s???",
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
                    itemCount: RequestFriendsGroupConstants
                        .SHARE_BOTTOM_SHEET_CONTENT_LIST.length,
                    itemBuilder: ((context, index) {
                      return InformationUserGroupWidget(
                        [
                          Text(
                            RequestFriendsGroupConstants
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
                            RequestFriendsGroupConstants
                                .SHARE_BOTTOM_SHEET_CONTENT_LIST[index][0],
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 5),
                        // changeBackground: Colors.transparent,
                      );
                    })),
              )
            ]),
          );
        });
      });
}

// t???o ra th??nh ph???n g???m prefix, n???i dung, suffix
Widget _buildExampleComponent(String title, bool isSelected, {IconData? icon}) {
  return Flex(
    direction: Axis.horizontal,
    children: [
      Container(
        margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
        height: 35,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: isSelected ? Colors.blue : Colors.grey[800]),
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
  );
}

_showBottomSheetSelectionGroupForRequestFriend(
    BuildContext context, double width) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: 460,
          decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15))),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Center(
                    child: Text(
                      "Nh??m c???a b???n",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )),
                ],
              ),
            ),
            //divider
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            // content listView

            Expanded(
              child: ListView.builder(
                  itemCount:
                      RequestFriendsGroupConstants.SELECTION_FOR_CHOOSE_GROUP_GROUP.length,
                  itemBuilder: ((context1, index) {
                    return InformationUserGroupWidget(
                      [
                        Text(
                          RequestFriendsGroupConstants
                              .SELECTION_FOR_CHOOSE_GROUP_GROUP[index][1],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          RequestFriendsGroupConstants
                              .SELECTION_FOR_CHOOSE_GROUP_GROUP[index][2],
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                      prefixWidget: Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Image.asset(
                          RequestFriendsGroupConstants
                              .SELECTION_FOR_CHOOSE_GROUP_GROUP[index][0],
                        ),
                      ),
                      suffixWidget: Container(
                        // height: 50,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                          child: Text(
                            "Th??m",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 5),
                    );
                  })),
            ),
          ]),
        );
      });
}

_showBottomSheetForRequestFriendByEmail(BuildContext context, double height) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return BlocBuilder<SelectionPrivateGroupBloc,
            SelectionPrivateGroupState>(builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: height,
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
            child: Column(children: [
              SizedBox(
                height: 40,
              ),
              // title
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (() {
                        Navigator.of(context).pop();
                        FocusManager.instance.primaryFocus!.unfocus();
                      }),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                        child: Center(
                      child: Text(
                        "Chia s???",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )),
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Center(
                          child: Text(
                            "G???i",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )),
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
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        bottom: 5,
                      ),
                      child: Center(
                        child: Text(
                          "Nh???p ?????a ch??? email ????? m???i ai ????",
                          style: TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                      )),
                ],
              ),
              Container(
                height: 80,
                child: TextFormField(
                  onChanged: ((value) {}),
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      hintText: "?????a ch??? Email",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              InformationUserGroupWidget([
                Text(
                  "Tin nh???n m???i",
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
                Text(
                  "Xin ch??o! M???i b???n tham gia nh??m c???a t??i nh??. B???n c?? th??? tham gia qua li??n k???t trong email n??y!",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ],changeBackground: Colors.grey[800],)
            ]),
          );
        });
      });
}
