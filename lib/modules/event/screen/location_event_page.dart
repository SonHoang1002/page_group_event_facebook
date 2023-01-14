import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:self_facebook_project/general/common_event.dart';
import 'package:self_facebook_project/general/common_group.dart';
import 'package:self_facebook_project/modules/event/export_event_page.dart';
import 'package:self_facebook_project/modules/event/screen/description_event_page.dart';
import 'package:self_facebook_project/modules/event/widget/event_with_facebook_live_event.dart';
import 'package:self_facebook_project/modules/event/widget/information_user_event_widget.dart';

class LocationEventPage extends StatefulWidget {
  const LocationEventPage({super.key});

  @override
  State<LocationEventPage> createState() => _LocationEventPageState();
}

class _LocationEventPageState extends State<LocationEventPage> {
  bool isOutsideLink = false;
  bool isDifferent = false;
  bool isLiveMeetingRoomSelection = false;
  bool isFacebookLiveSelection = false;
  late double width = 0;
  late TextEditingController _urlController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black87,
      body: GestureDetector(
        onTap: (() {
          FocusManager.instance.primaryFocus!.unfocus();
        }),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            Expanded(
                child: Column(
              children: [
                //app bar title
                Container(
                  margin: EdgeInsets.only(
                    top: 60,
                  ),
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
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            CommonEvent.CANCEL,
                            style: TextStyle(
                                color: Colors.grey[200], fontSize: 18),
                          ),
                        )
                      ]),
                ),
                // title detail event
                Container(
                  // height: FocusManager.instance.primaryFocus!.hasFocus ? 430:635,
                  height: 635,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30, bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              LocationEventCommon.LOCATION_EVENT_TITLE,
                              style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      // ---------------------------------ONLINE--------------------------------------
                      Container(
                        child: Row(
                          children: [
                            Text(
                              LocationEventCommon
                                  .ONLINE_LOCATION_EVENT_SUBTITLE,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      // ---------------------------------OFFLINE--------------------------------------
                      // Container(
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         LocationEventCommon.OFFLINE_LOCATION_EVENT_SUBTITLE,
                      //         style:
                      //             TextStyle(fontSize: 16, color: Colors.white),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      //space
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // // select location from map in bottom sheet
                      // Container(
                      //   height: 50,
                      //   child: TextFormField(
                      //     readOnly: true,
                      //     onTap: () {
                      //       _showBottomSheetSelectLocation(context);
                      //     },
                      //     // controller:  ???,
                      //     style: TextStyle(color: Colors.white),
                      //     decoration: InputDecoration(
                      //         enabledBorder: OutlineInputBorder(
                      //             borderSide: BorderSide(color: Colors.grey),
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(5))),
                      //         focusedBorder: OutlineInputBorder(
                      //             borderSide: BorderSide(color: Colors.blue),
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(5))),
                      //         contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      //         border: InputBorder.none,
                      //         hintText: LocationEventCommon
                      //             .OFFLINE_PLACEHOLDER_EVENT[0],
                      //         labelStyle: TextStyle(color: Colors.white),
                      //         hintStyle: TextStyle(color: Colors.white)),
                      //   ),
                      // ),

                      // ---------------------------------OFFLINE--------------------------------------


                      // space
                      SizedBox(
                        height: 10,
                      ),
                      // meeting room
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute(builder: (_) => DetailEventPage()));
                          setState(() {
                            isDifferent = isOutsideLink = false;
                            isLiveMeetingRoomSelection = true;
                            isFacebookLiveSelection = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: isLiveMeetingRoomSelection
                                      ? Colors.blue
                                      : Colors.transparent)),
                          child: InformationUserEventWidget(
                            [
                              Container(
                                margin: EdgeInsets.only(top: 5, left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                        LocationEventCommon
                                            .MEETING_ROOM_COMPONENT[1],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, left: 10),
                                child: Wrap(
                                  children: [
                                    Text(
                                        LocationEventCommon
                                            .MEETING_ROOM_COMPONENT[2],
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.grey))
                                  ],
                                ),
                              ),
                            ],
                            prefixWidget: Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(left: 10),
                              child: LocationEventCommon
                                      .MEETING_ROOM_COMPONENT[0] is String
                                  ? SvgPicture.asset(
                                      LocationEventCommon
                                          .MEETING_ROOM_COMPONENT[0],
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      LocationEventCommon
                                          .MEETING_ROOM_COMPONENT[0],
                                      size: 15,
                                      color: Colors.white,
                                    ),
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                      ),
                      // space
                      SizedBox(
                        height: 15,
                      ),

                      // facebook live
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute(builder: (_) => DetailEventPage()));
                          setState(() {
                            isDifferent = isOutsideLink = false;
                            isLiveMeetingRoomSelection = false;
                            isFacebookLiveSelection = true;
                          });
                          showBottomSheetEventWithFacebookLive(context, width);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: isFacebookLiveSelection
                                      ? Colors.blue
                                      : Colors.transparent)),
                          child: InformationUserEventWidget(
                            [
                              Container(
                                margin: EdgeInsets.only(top: 5, left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                        LocationEventCommon
                                            .FACEBOOK_LIVE_COMPONENT[1],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, left: 10),
                                child: Wrap(
                                  children: [
                                    Text(
                                        LocationEventCommon
                                            .FACEBOOK_LIVE_COMPONENT[2],
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.grey))
                                  ],
                                ),
                              ),
                            ],
                            prefixWidget: Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(left: 10),
                              child: LocationEventCommon
                                      .FACEBOOK_LIVE_COMPONENT[0] is String
                                  ? SvgPicture.asset(
                                      LocationEventCommon
                                          .FACEBOOK_LIVE_COMPONENT[0],
                                      color: Colors.white,
                                      height: 5,
                                      width: 5,
                                      fit: BoxFit.scaleDown)
                                  : Icon(
                                      LocationEventCommon
                                          .FACEBOOK_LIVE_COMPONENT[0],
                                      size: 15,
                                      color: Colors.white,
                                    ),
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      isDifferent == false && isOutsideLink == false
                          ? GestureDetector(
                              onTap: () {
                                showBottomSheetDifferentSelection(context);
                              },
                              child: Center(
                                  child: Text(
                                LocationEventCommon.ADD_PRIVATE_LINK,
                                style: TextStyle(color: Colors.blue),
                              )),
                            )
                          : Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      LocationEventCommon.DIFFERENT_SELECTION,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showBottomSheetDifferentSelection(
                                            context);
                                      },
                                      child: Text(
                                        LocationEventCommon.CHANGE_SELECTION,
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.blue),
                                      ),
                                    ),
                                  ]),
                            ),
                      isDifferent
                          ? _buildSingleDifferentSelectionComponent(
                              LocationEventCommon
                                  .DIFFERENT_SELECTION_COMPONENT[1])
                          : Container(),
                      isOutsideLink
                          ? _buildSingleDifferentSelectionComponent(
                              LocationEventCommon
                                  .DIFFERENT_SELECTION_COMPONENT[0],
                              addtionalWidget: Container(
                                height: 70,
                                margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                child: TextFormField(
                                  onTap: (() {
                                    // if (validateUrlLink(_urlController.text)) {}
                                  }),
                                  controller: _urlController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      fillColor: Colors.black,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        // borderSide: BorderSide(
                                        //     color: validateUrlLink(
                                        //             _urlController.text.trim())
                                        //         ? Colors.blue
                                        //         : Colors.red),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      hintText: "URL liên kết",
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ))
                          : Container(),
                    ],
                  ),
                ),
              ],
            )),
            // bottom button
            Container(
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
                                    backgroundColor: isDifferent ||
                                            isFacebookLiveSelection ||
                                            isLiveMeetingRoomSelection ||
                                            (isOutsideLink &&
                                                _urlController.text.trim() !=
                                                    "")
                                        ? Colors.blue
                                        : Colors.grey[800]),
                                onPressed: () {
                                  if (isDifferent ||
                                      isFacebookLiveSelection ||
                                      isLiveMeetingRoomSelection ||
                                      (isOutsideLink &&
                                          _urlController.text.trim() != "")) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                DescriptionEventPage()));
                                  }
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
            ),
          ]),
        ),
      ),
    );
  }

  showBottomSheetDifferentSelection(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 270,
            decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
            child: Column(children: [
              //icon horizontal
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Center(
                      child: Text(
                        LocationEventCommon.DIFFERENT_SELECTION,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )),
                  ],
                ),
              ),
              Divider(
                height: 10,
                color: Colors.white,
              ),
              //content
              Container(
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                          onTap: (() {
                            Navigator.of(context).pop();
                            if (LocationEventCommon
                                    .DIFFERENT_SELECTION_COMPONENT[index][1] ==
                                "Khác") {
                              setState(() {
                                isDifferent = true;
                                isOutsideLink = false;
                                isFacebookLiveSelection =
                                    isLiveMeetingRoomSelection = false;
                              });
                              return;
                            }
                            setState(() {
                              isDifferent = false;
                              isOutsideLink = true;
                              isFacebookLiveSelection =
                                  isLiveMeetingRoomSelection = false;
                            });
                            // Navigator.of(context).pop();
                            return;
                          }),
                          child: _buildSingleDifferentSelectionComponent(
                              LocationEventCommon
                                  .DIFFERENT_SELECTION_COMPONENT[index]));
                    }),
                  ))
            ]),
          );
        });
  }

  Widget _buildSingleDifferentSelectionComponent(List<dynamic> value,
      {Widget? addtionalWidget}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: InformationUserEventWidget(
        [
          Container(
            margin: EdgeInsets.only(top: 5, left: 10),
            child: Row(
              children: [
                Text(value[1],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, left: 10),
            child: Wrap(
              children: [
                Text(value[2],
                    style: TextStyle(fontSize: 15, color: Colors.grey))
              ],
            ),
          ),
          addtionalWidget ?? Container()
        ],
        prefixWidget: Container(
          height: 40,
          width: 40,
          margin: EdgeInsets.only(left: 10),
          child: Center(
              child: value[0] is String
                  ? Container(
                      height: 20,
                      width: 20,
                      child: SvgPicture.asset(
                        value[0],
                        color: Colors.white,
                      ),
                    )
                  : Icon(
                      value[0],
                      size: 15,
                      color: Colors.white,
                    )),
          decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        // changeBackground: Colors.grey[800],
        // padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
      ),
    );
  }

  _showBottomSheetSelectLocation(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setStateFull) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              height: 500,
              decoration: BoxDecoration(
                  color: Colors.grey[900],
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Center(
                        child: Text(
                          LocationEventCommon.OFFLINE_PRIVATE_OF_EVENT,
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
                // find location input
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 290,
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
                              hintText: LocationEventCommon
                                  .OFFLINE_PLACEHOLDER_EVENT[1],
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                      ),
                      // SizedBox(width: 5,),
                      Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(left: 10),
                          child: Center(
                            child: Container(
                              height: 20,
                              width: 20,
                              // child: SvgPicture.asset(
                              //   CommonEvent.PATH_ICON + "camera_plus_icon.svg",
                              //   color: Colors.white,
                              // ),
                              child:Icon(CupertinoIcons.location,color: Colors.white, size: 14,)
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey[700],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ],
                  ),
                ),
                // divider
                Divider(
                  height: 4,
                  color: Colors.white,
                ),
                // img example for location
                Container(
                    height: 100,
                    width: 200,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      CommonEvent.PATH_IMG + "back_1.jpg",
                      fit: BoxFit.fitWidth,
                    )),
                // find location near you
                Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      LocationEventCommon.OFFLINE_FIND_LOCATION_NEAR_FOR_YOU,
                      style: TextStyle(color: Colors.grey, fontSize: 18,fontWeight: FontWeight.bold),
                    )),
                // please open location service
                Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Text(
                        LocationEventCommon.OFFLINE_OPEN_LOCATION_SERVICE,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    )),
                // open location service button

                Container(
                  width: 80,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        FocusManager.instance.primaryFocus!.unfocus();
                      },
                      style:
                          ElevatedButton.styleFrom(fixedSize: Size(width, 30)),
                      child: Text(
                        LocationEventCommon
                            .OFFLINE_OPEN_LOCATION_SERVICE_BUTTON,
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Divider(
                  height: 4,
                  color: Colors.white,
                ),
              ]),
            );
          });
        });
  }

  bool validateUrlLink(String input) {
    RegExp exp =
        new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    return (exp.hasMatch(input));
  }
}
