import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:self_facebook_project/general/common_event.dart';
import 'package:self_facebook_project/modules/event/export_event_page.dart';
import 'package:self_facebook_project/modules/event/widget/information_user_event_widget.dart';

class CreateEventPage extends StatelessWidget {
  const CreateEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  CommonEvent.CANCEL,
                  style: TextStyle(color: Colors.grey[200], fontSize: 18),
                ),
              )
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Row(
              children: [
                Text(
                  CreateEventCommon.CREATE_EVENT_TITLE,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => DetailEventPage()));
            },
            child: InformationUserEventWidget(
              [
                Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.only(left: 10),
                  child: Center(
                      child: Icon(
                    CreateEventCommon.ONLINE_COMPONENT[0],
                    size: 15,
                    color: Colors.white,
                  )),
                  decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 10),
                  child: Row(
                    children: [
                      Text(CreateEventCommon.ONLINE_COMPONENT[1],
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 10),
                  child: Wrap(
                    children: [
                      Text(CreateEventCommon.ONLINE_COMPONENT[2],
                          style: TextStyle(fontSize: 18, color: Colors.grey))
                    ],
                  ),
                ),
              ],
              suffixWidget: Container(
                margin: EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: Icon(
                  CreateEventCommon.ICON_DATA_NEXT,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => DetailEventPage()));
            },
            child: InformationUserEventWidget(
              [
                Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.only(left: 10),
                  child: Center(
                      child: Icon(
                    CreateEventCommon.LIVE_MEETING_COMPONENT[0],
                    size: 15,
                    color: Colors.white,
                  )),
                  decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 10),
                  child: Row(
                    children: [
                      Text(CreateEventCommon.LIVE_MEETING_COMPONENT[1],
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 10),
                  child: Wrap(
                    children: [
                      Text(CreateEventCommon.LIVE_MEETING_COMPONENT[2],
                          style: TextStyle(fontSize: 18, color: Colors.grey))
                    ],
                  ),
                ),
              ],
              suffixWidget: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 10),
                child: Icon(
                  CreateEventCommon.ICON_DATA_NEXT,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
