import 'package:flutter/material.dart';
import 'package:self_facebook_project/general/common_event.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            //app bar
            Expanded(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Icon(
                            CommonEvent.ICON_PRIVIOUS,
                            color: Colors.grey,
                            size: 18,
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
                Container(
                  child: Row(
                    children: [
                      Text(
                        LocationEventCommon.LOCATION_EVENT_SUBTITLE,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
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
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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
                                  LocationEventCommon.MEETING_ROOM_COMPONENT[1],
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
                                  LocationEventCommon.MEETING_ROOM_COMPONENT[2],
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey))
                            ],
                          ),
                        ),
                      ],
                      prefixWidget: Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(left: 10),
                        child: Center(
                            child: Icon(
                          LocationEventCommon.MEETING_ROOM_COMPONENT[0],
                          size: 15,
                          color: Colors.white,
                        )),
                        decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                  ),
                ),
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
                    showBottomSheetEventWithFacebookLive(context,width);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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
                        margin: EdgeInsets.only(left: 10),
                        child: Center(
                            child: Icon(
                          LocationEventCommon.FACEBOOK_LIVE_COMPONENT[0],
                          size: 15,
                          color: Colors.white,
                        )),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  showBottomSheetDifferentSelection(context);
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
                        LocationEventCommon.DIFFERENT_SELECTION_COMPONENT[1])
                    : Container(),
                isOutsideLink
                    ? _buildSingleDifferentSelectionComponent(
                        LocationEventCommon.DIFFERENT_SELECTION_COMPONENT[0],
                        addtionalWidget: Container(
                          height: 70,
                          margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Colors.black,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                hintText: "URL liên kết",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ))
                    : Container(),
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
                                    backgroundColor: Colors.grey[800]),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => DescriptionEventPage()));
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
              child: Icon(
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
}
