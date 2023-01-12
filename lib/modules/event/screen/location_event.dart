import 'package:flutter/material.dart';
import 'package:self_facebook_project/general/common_event.dart';
import 'package:self_facebook_project/modules/event/export_event_page.dart';
import 'package:self_facebook_project/modules/event/widget/information_user_event_widget.dart';

class LocationEventPage extends StatelessWidget {
  const LocationEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
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
                      style: TextStyle(color: Colors.grey[200], fontSize: 18),
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
          GestureDetector(
            onTap: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (_) => DetailEventPage()));
            },
            child: InformationUserEventWidget(
              [
                Container(
                  margin: EdgeInsets.only(top: 5, left: 10),
                  child: Row(
                    children: [
                      Text(LocationEventCommon.MEETING_ROOM_COMPONENT[1],
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
                      Text(LocationEventCommon.MEETING_ROOM_COMPONENT[2],
                          style: TextStyle(fontSize: 15, color: Colors.grey))
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
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (_) => DetailEventPage()));
            },
            child: InformationUserEventWidget(
              [
                Container(
                  margin: EdgeInsets.only(top: 5, left: 10),
                  child: Row(
                    children: [
                      Text(LocationEventCommon.FACEBOOK_LIVE_COMPONENT[1],
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
                      Text(LocationEventCommon.FACEBOOK_LIVE_COMPONENT[2],
                          style: TextStyle(fontSize: 15, color: Colors.grey))
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
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              showBottomSheetDifferentSelection(context);
            },
            child: Center(
                child: Text(
              LocationEventCommon.ADD_PRIVATE_LINK,
              style: TextStyle(color: Colors.blue),
            )),
          )
        ]),
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
            height: 200,
            decoration: BoxDecoration(
                color: Colors.red,
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
                        DetailEventCommon.PRIVATE_OF_EVENT,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )),
                  ],
                ),
              ),
              Divider(
                height: 4,
                color: Colors.white,
              ),
              Container(
                  height: 80,
                  child: ListView.builder(
                    itemBuilder: ((context, index) {
                      return Container();
                    }),
                  ))
            ]),
          );
        });
  }
}
