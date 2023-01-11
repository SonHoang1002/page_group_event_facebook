import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:self_facebook_project/general/common_group.dart';
import 'package:self_facebook_project/modules/group/screen/cover_image_group_page.dart';
import 'package:self_facebook_project/modules/group/widgets/addtional_information_group_widget.dart';
import 'package:self_facebook_project/modules/group/widgets/format_input.dart';
import 'package:self_facebook_project/modules/group/widgets/information_user_group_widget.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
import 'package:self_facebook_project/modules/page/blocs/name_bloc.dart';
import 'package:self_facebook_project/modules/page/model/name_model.dart';
import 'package:self_facebook_project/modules/page/register/parts/category_page.dart';
import 'package:self_facebook_project/modules/page/register/primary_page.dart';

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
        // appBar: AppBar(
        //   title: Center(child: Text(CreateGroupCommon.TITLE_APPBAR)),
        // ),
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

////////////////////////////////// public /////////////////////////////////////

                        // build share widget
                        // InformationUserWidget(
                        //   context: context,
                        //   prefixWidget: Icon(
                        //     FontAwesomeIcons.share,
                        //     color: Colors.white,
                        //     size: 17,
                        //   ),
                        //   title: "Chia sẻ",
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),

                        // build email widget
                        // InformationUserWidget(
                        //   context: context,
                        //   prefixWidget: Icon(
                        //     FontAwesomeIcons.envelope,
                        //     color: Colors.white,
                        //     size: 17,
                        //   ),
                        //   title: RequestFriendsGroupCommon.EMAIL_REQUEST_TITLE,
                        //   subTitleWidget: Container(
                        //     margin: EdgeInsets.only(),
                        //     child: Text(RequestFriendsGroupCommon.EMAIL_REQUEST_SUBTITLE,
                        //         style: TextStyle(
                        //             color: Colors.white, fontSize: 13)),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),

                        // build example widget
                        // Row(
                        //   children: [
                        //     _buildExampleComponent("Gợi ý"),
                        //     _buildExampleComponent('Hà Nội',
                        //         icon: FontAwesomeIcons.city),
                        //     _buildExampleComponent('Nhóm chung',
                        //         icon: FontAwesomeIcons.peopleGroup)
                        //   ],
                        // ),

////////////////////////////////// private /////////////////////////////////////
                        // build email widget
                        InformationUserWidget(
                          context: context,
                          prefixWidget: Icon(
                            FontAwesomeIcons.envelope,
                            color: Colors.white,
                            size: 17,
                          ),
                          title: RequestFriendsGroupCommon.EMAIL_REQUEST_TITLE,
                          subTitleWidget: Container(
                            margin: EdgeInsets.only(),
                            child: Text(
                                RequestFriendsGroupCommon
                                    .EMAIL_REQUEST_SUBTITLE,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              RequestFriendsGroupCommon.PRIVATE_TITLE[0],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(RequestFriendsGroupCommon.PRIVATE_SUB_TITLE[0],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 23)),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              RequestFriendsGroupCommon.PRIVATE_TITLE[1],
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
                        Text(RequestFriendsGroupCommon.PRIVATE_SUB_TITLE[1],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 17)),
                        const SizedBox(
                          height: 16,
                        ),
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
                            SizedBox(
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
                              padding: EdgeInsets.only(right: 10,),
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

                        // goi y

                        // Row(
                        //   children: [
                        //     Text(
                        //       RequestFriendsGroupCommon.PUBLIC_TITLE[2],
                        //       style: const TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 20,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 10,
                        ),

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
                          height: 130,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return Container(
                                    // margin: EdgeInsets.symmetric(vertical: 5),
                                    child: InformationUserWidget(
                                        context: context,
                                        prefixWidget: Image.asset(
                                            RequestFriendsGroupCommon
                                                .IMG_PATH_LIST[index]),
                                        title: "People ${index}",
                                        suffixWidget: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    side: BorderSide())),
                                            onPressed: () {
                                              print(index);
                                            },
                                            child: Center(
                                              child: Text(
                                                "Mời",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ))));
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
