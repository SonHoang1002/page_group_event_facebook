import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:self_facebook_project/general/common_event.dart';
import 'package:self_facebook_project/modules/event/blocs/selection_private_event_bloc.dart';
import 'package:self_facebook_project/modules/event/export_event_page.dart';
import 'package:self_facebook_project/modules/event/screen/description_event_page.dart';
import 'package:self_facebook_project/modules/event/screen/location_event_page.dart';
import 'package:self_facebook_project/modules/event/screen/setting_event_page.dart';
import 'package:self_facebook_project/modules/event/widget/information_user_event_widget.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';

class ReviewEventPage extends StatefulWidget {
  @override
  State<ReviewEventPage> createState() => _ReviewEventPageState();
}

class _ReviewEventPageState extends State<ReviewEventPage> {
  late double width = 0;
  bool isPrivateSelection = true;
  File? _pickedImage;
  XFile? _xFile;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            Expanded(
              child: Column(
                children: [
                  //title app bar
                  Container(
                    margin: EdgeInsets.only(
                        top: 60, right: 10, left: 10, bottom: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: GestureDetector(
                              onTap: (() {
                                Navigator.of(context).pop();
                              }),
                              child: Icon(
                                CommonEvent.ICON_PRIVIOUS,
                                color: Colors.grey,
                                size: 18,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              ReviewEventCommon.REVIEW_EVENT_APPBAR_TITLE,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text(
                              CommonEvent.CANCEL,
                              style: TextStyle(
                                  color: Colors.grey[200], fontSize: 18),
                            ),
                          )
                        ]),
                  ),
                  // add cover image
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.8),
                          ),
                          child: _pickedImage != null
                              ? Image.file(
                                  _pickedImage!,
                                  fit: BoxFit.fitWidth,
                                )
                              : Container(),
                        ),
                        Container(
                          height: 150,
                          child: GestureDetector(
                            onTap: (() {
                              getCoverImage();
                            }),
                            child: Center(
                                child: Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.6),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.layerGroup,
                                          color: Colors.white,
                                          size: 13,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Thêm ảnh bìa",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        )
                                      ],
                                    ))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => DetailEventPage()));
                      },
                      child: InformationUserEventWidget(
                        [
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Row(
                              children: [
                                Text(
                                  ReviewEventCommon.TIME_EVENT,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Row(
                              children: [
                                Text(
                                  ReviewEventCommon.NAME_EVENT,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(children: [
                              Container(
                                // width: 30,
                                // height: 30,
                                margin: EdgeInsets.only(right: 8),
                                child: Center(
                                  child: Icon(
                                    FontAwesomeIcons.lock,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                              ),
                              Text(ReviewEventCommon.RANGE_EVENT,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(ReviewEventCommon.ORGANIZE_PERSON,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  )),
                            ]),
                          )
                        ],
                        padding: EdgeInsets.zero,
                        suffixWidget: Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(
                            CommonEvent.ICON_DATA_NEXT,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // selections
                  Container(
                    height: 160,
                    margin: EdgeInsets.only(top: 10),
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount:
                            ReviewEventCommon.REVIEW_EVENT_CONTENT_LIST.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (ReviewEventCommon
                                      .REVIEW_EVENT_CONTENT_LIST[index][1] ==
                                  "Mô tả") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => DescriptionEventPage()));
                                return;
                              } else if (ReviewEventCommon
                                      .REVIEW_EVENT_CONTENT_LIST[index][1] ==
                                  "Vị trí") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => LocationEventPage()));
                                return;
                              }
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => SettingEventPage()));
                              return;
                            },
                            child: InformationUserEventWidget(
                              [
                                Text(
                                    ReviewEventCommon
                                        .REVIEW_EVENT_CONTENT_LIST[index][1],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                ReviewEventCommon.REVIEW_EVENT_CONTENT_LIST[
                                                index][2] ==
                                            "" ||
                                        ReviewEventCommon
                                                    .REVIEW_EVENT_CONTENT_LIST[
                                                index][2] ==
                                            null
                                    ? Container()
                                    : Column(
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              ReviewEventCommon
                                                      .REVIEW_EVENT_CONTENT_LIST[
                                                  index][2],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey))
                                        ],
                                      ),
                              ],
                              prefixWidget: Container(
                                  height: 40,
                                  width: 40,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[700],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Icon(
                                    ReviewEventCommon
                                        .REVIEW_EVENT_CONTENT_LIST[index][0],
                                    color: Colors.white,
                                    size: 15,
                                  )),
                              changeBackground: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              suffixWidget: Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(right: 10),
                                child: Icon(
                                  CommonEvent.ICON_DATA_NEXT,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                              ),
                            ),
                          );
                        })),
                  )
                ],
              ),
            ),

            // bottom navigate
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
                                      backgroundColor: Colors.grey[800]),
                                  onPressed: () {
                                   
                                  },
                                  child: Text(CommonEvent.NEXT)),
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
        ),
      ),
    );
  }

  Future<void> getCoverImage() async {
    _xFile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = File(_xFile!.path);
    });
  }
}
