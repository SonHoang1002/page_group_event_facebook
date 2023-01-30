import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:self_facebook_project/general/group_constants.dart';
import 'package:self_facebook_project/general/page_constants.dart';
import 'package:self_facebook_project/modules/group/widgets/information_user_group_widget.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
import 'package:self_facebook_project/modules/page/blocs/name_bloc.dart';

class CreatePostGroupPage extends StatefulWidget {
  @override
  State<CreatePostGroupPage> createState() => _CreatePostGroupPageState();
}

class _CreatePostGroupPageState extends State<CreatePostGroupPage> {
  late double width = 0;
  late double height = 0;
  late TextEditingController _postController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Container(
                        margin: EdgeInsets.only(top: 40, bottom: 10),
                        height: 50,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            CupertinoIcons.back,
                            color: Colors.white,
                            // size: 14,
                          ),
                        ),
                      )
                    ]),
                    Row(
                      children: [
                        Text(
                          CreatePostGroupConstants.TITLE[0],
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
                    Text(CreatePostGroupConstants.SUBTITLE[0],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18)),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        showBottomSheet(
                            enableDrag: true,
                            context: context,
                            builder: ((context) {
                              return Container(
                                height: height,
                                color: Colors.black87,
                                child: _createPostWidget(context, true),
                              );
                            }));
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            enableDrag: true,
                            context: context,
                            builder: ((context) {
                              return Container(
                                height: 500,
                                decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                child: ListView.builder(
                                    itemCount: 12,
                                    itemBuilder: ((context, index) {
                                      return Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 5, 10, 5),
                                        child: InformationUserGroupWidget(
                                          [
                                            Text(
                                              CreatePostGroupConstants
                                                  .CONTENT_LIST[index],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                          prefixWidget: Container(
                                            height: 20,
                                            width: 20,
                                            margin: EdgeInsets.only(right: 10),
                                            child: SvgPicture.asset(
                                              CreatePostGroupConstants
                                                  .ICON_PATH_LIST[index],
                                              color: CreatePostGroupConstants
                                                  .COLOR_LIST[index],
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          changeBackground: Colors.transparent,
                                        ),
                                      );
                                    })),
                              );
                            }));
                      },
                      child: _createPostWidget(context, false),
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
                                  child: Text(PageConstants.NEXT)),
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

  Widget _createPostWidget(BuildContext context, bool inSheet) {
    return Column(
      children: [
        inSheet
            ? Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              FontAwesomeIcons.close,
                              color: Colors.white,
                            ))
                      ]),
                    ),
                    Text(
                      CreatePostGroupConstants.TITLE[1],
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800]),
                        onPressed: () {},
                        child: Text(
                          "Đăng",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Container(),
        Container(
          height: inSheet ? height * 0.85 : 500,
          decoration: inSheet
              ? null
              : BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: InformationUserGroupWidget(
                  [
                    Text(
                      CreatePostGroupConstants.USER_EXAMPLE[0],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    inSheet
                        ? Container(
                            // height: 20,
                            // color: Colors.red,
                            // width: 200,
                            margin: EdgeInsets.only(top: 5),
                            // padding: EdgeInsets.only(right: 5),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.userGroup,
                                        color: Colors.white,
                                        size: 10,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        CreatePostGroupConstants.USER_EXAMPLE[1],
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      width: 150,
                                      child: Divider(
                                          height: 3, color: Colors.white))
                                ]),
                          )
                        : Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Text(CreatePostGroupConstants.USER_EXAMPLE[1],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                )),
                          ),
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
                      GroupConstants.PATH_IMG + "cat_1.png",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: TextFormField(
                  // maxLines: 2,
                  controller: _postController,
                  onTap: (() {
                    if (!inSheet) {
                      /////////////////////////////////////////////////
                    }
                  }),
                  readOnly: !inSheet,
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  style: TextStyle(
                      color: Colors.white, overflow: TextOverflow.visible),
                  decoration: InputDecoration(
                      hintText: CreatePostGroupConstants.PLACEHOLDER_LIST[0],
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      border: InputBorder.none,
                      fillColor: Colors.transparent,
                      filled: true),
                ),
              ),

              // nếu có đăng ảnh vào đây
              // Container(
              //     // height: 400,
              //     width: width,
              //     color: Colors.white,
              //     child: Image.asset(
              //       ConstantsGroup.PATH_IMG + "back_1.jpg",
              //       fit: BoxFit.fitWidth,
              //     )),
            ],
          ),
        ),
      ],
    );
  }
}
