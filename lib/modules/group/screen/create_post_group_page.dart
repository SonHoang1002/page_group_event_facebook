import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:self_facebook_project/general/common_group.dart';
import 'package:self_facebook_project/general/common_page.dart';
import 'package:self_facebook_project/modules/group/screen/target_group_page.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
import 'package:self_facebook_project/modules/page/blocs/name_bloc.dart';
import 'package:self_facebook_project/modules/page/model/name_model.dart';
import 'package:self_facebook_project/modules/page/register/parts/category_page.dart';
import 'package:self_facebook_project/modules/page/register/parts/phone_page.dart';
import 'dart:io';
import 'package:self_facebook_project/modules/page/register/primary_page.dart';

class CreatePostGroupPage extends StatefulWidget {
  @override
  State<CreatePostGroupPage> createState() => _CreatePostGroupPageState();
}

class _CreatePostGroupPageState extends State<CreatePostGroupPage> {
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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          )),
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
                          CreatePostGroupCommon.TITLE[0],
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
                    Text(CreatePostGroupCommon.SUBTITLE[0],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18)),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      // height: 490,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: SizedBox(
                        // height: 60,
                        child: _buildFlexibleComponent(
                            context,
                            Image.asset(CommonGroup.PATH_IMG + "cat_1.png"),
                            ["Son Hoang", "Thanh vien cua nhom  @@@@"],
                            Container()),
                      ),
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
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (_) => TargetGroupPage()));
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
                    // width: 250,
                    margin: EdgeInsets.only(),
                    child: Text(listContent[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                  listContent.length == 2
                      ? Container(
                          // width: 130,
                          height: 30,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              // color: Colors.grey.withOpacity(0.6),
                              border: Border.all(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                              child: Text(listContent[1],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ))),
                        )
                      : Container()
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
