import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:self_facebook_project/general/common_event.dart';
import 'package:self_facebook_project/modules/event/widget/information_user_event_widget.dart';

class SettingEventPage extends StatelessWidget {
  const SettingEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          // title appBar
          Container(
            margin: EdgeInsets.only(top: 60, right: 10, left: 10, bottom: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                child: Icon(
                  CommonEvent.ICON_PRIVIOUS,
                  color: Colors.grey,
                  size: 18,
                ),
              ),
            ]),
          ),

          Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Text(
                  SettingEventCommon.SETTING_TITLE,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          Container(
            // color: Colors.red,
            child: InformationUserEventWidget(
              [
                Text(
                  SettingEventCommon.CO_ORGANIZER[1],
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
                    SettingEventCommon.CO_ORGANIZER[0],
                    color: Colors.white,
                    size: 15,
                  )),
              suffixWidget: Icon(
                CommonEvent.ICON_DATA_NEXT,
                color: Colors.grey,
                size: 20,
              ),
              changeBackground: Colors.transparent,
              padding: EdgeInsets.only(top: 15, bottom: 15),
            ),
          ),

          // share link
          Container(
            child: InformationUserEventWidget(
              [
                Container(
                  width: 280,
                  child: Text(
                    SettingEventCommon.SHARE_LINK_CONTENT,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ],
              suffixWidget: Switch(
                onChanged: (value) {},
                value: true,
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2.5),
              changeBackground: Colors.transparent,
            ),
          ),

          Container(
            // margin: EdgeInsets.only(top: 5),
            child: Wrap(
              children: [
                Text(
                  SettingEventCommon.DESCRIPTION_FOR_SHARE_LINK_CONTENT,
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
