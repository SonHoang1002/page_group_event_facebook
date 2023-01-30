
import 'package:flutter/material.dart';
import 'package:self_facebook_project/general/event_constants.dart';
import 'package:self_facebook_project/modules/event/widget/information_user_event_widget.dart';

class SettingEventPage extends StatefulWidget {
  @override
  State<SettingEventPage> createState() => _SettingEventPageState();
}

class _SettingEventPageState extends State<SettingEventPage> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          // title appBar
          Container(
            margin: EdgeInsets.only(top: 60, right: 10, left: 10, bottom: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                child: GestureDetector(
                  onTap: (() {
                    Navigator.of(context).pop();
                  }),
                  child: Icon(
                    EventConstants.ICON_PRIVIOUS,
                    color: Colors.grey,
                    size: 18,
                  ),
                ),
              ),
            ]),
          ),
          
          // setting title
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Text(
                  SettingEventConstants.SETTING_TITLE,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          
          // co-organizer part
          Container(
            // color: Colors.red,
            child: InformationUserEventWidget(
              [
                Text(
                  SettingEventConstants.CO_ORGANIZER[1],
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
              prefixWidget: Container(
                  height: 30,
                  width: 30,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Icon(
                    SettingEventConstants.CO_ORGANIZER[0],
                    color: Colors.white,
                    size: 15,
                  )),
              suffixWidget: Icon(
                EventConstants.ICON_DATA_NEXT,
                color: Colors.grey,
                size: 20,
              ),
              changeBackground: Colors.transparent,
              padding: EdgeInsets.only(top: 15, bottom: 15),
            ),
          ),


          // this below widget only will be shown when user choose live meeting room method from location, include share link and description
          // share link
          Container(
            child: InformationUserEventWidget(
              [
                Container(
                  width: 280,
                  child: Text(
                    SettingEventConstants.SHARE_LINK_CONTENT,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ],
              suffixWidget: Switch(
                thumbColor:
                    MaterialStateProperty.resolveWith((states) => Colors.blue),
                onChanged: (value) {
                  setState(() {
                    switchValue = !switchValue;
                  });
                },
                value: switchValue,
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2.5),
              changeBackground: Colors.transparent,
            ),
          ),
          
          // description for share link function
          Container(
            // margin: EdgeInsets.only(top: 5),
            child: Wrap(
              children: [
                Text(
                  SettingEventConstants.DESCRIPTION_FOR_SHARE_LINK_CONTENT,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
