import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:self_facebook_project/general/common_group.dart';
import 'package:self_facebook_project/modules/group/export_group_page.dart';

import 'package:self_facebook_project/modules/group/widgets/addtional_information_group_widget.dart';
import 'package:self_facebook_project/modules/group/widgets/format_input_widget.dart';

class CreateGroupPage extends StatefulWidget {
  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  late double width = 0;
  late String selectPrivateRule = "";
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
                          // controller:
                          //     namePageState.namePageModel.nameController,
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
                      buildEmptyInput(context),
                      // space
                      const SizedBox(
                        height: 10,
                      ),

                      AddtionalInformationGroupWidget(contentWidget: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: CreateGroupCommon.DEFEND_PRIVATE_RULE[0],
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                              )),
                          TextSpan(
                              text: CreateGroupCommon.DEFEND_PRIVATE_RULE[1],
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
                      buildFillInput(context, FontAwesomeIcons.eye,
                          CreateGroupCommon.TITLE_LIST[2], "Hiển thị"),
                      //   ],
                      // ): Container()
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
                        backgroundColor: Colors.grey[800]),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => RequestFriendsGroupPage()));
                    },
                    child: Text(CommonGroup.CREATE_GROUP)),
              ),
            )
          ]),
        ));
  }
}
